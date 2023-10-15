import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/core/usecase/usecase.dart';
import '../../../app/core/utils/helpers/helpers.dart';
import '../../../app/core/utils/value_managers/assets_manager.dart';
import '../../../domain/entites/order_details_entity.dart';
import '../../../domain/home/usecases/get_current_location_usecase.dart';
import '../../../domain/home/usecases/get_polyline_usecase.dart';
import '../../../domain/orders/usecases/complete_delivery_usecase.dart';
import '../../../domain/orders/usecases/load_ready_to_deliver_orders_usecase.dart';
import '../../../domain/orders/usecases/shared_params/update_order_params.dart';

part 'home_event.dart';
part 'home_state.dart';

const _markerID = MarkerId("current_location");

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final mapCompleter = Completer<GoogleMapController>();
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  List<OrderDetailsEntity> readyToDeliverOrders = [];

  Future<void> _handleGetCurrentLocation(Emitter<HomeState> emit) async {
    emit(CurrentLocationLoadingState());
    final mapController = await mapCompleter.future;
    final res = await _getCurrentLocation(NoParams());
    final icon = await AppHelpers.setCustomMarkerIcon(
        path: ImgManager.pngMyLocation, width: 120);

    res.fold(
      (failure) {
        emit(CurrentLocationFailureState());
      },
      (latLng) {
        mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: 15)));
        markers.removeWhere((marker) => marker.markerId == _markerID);
        markers.add(
          Marker(
            icon: icon,
            markerId: _markerID,
            position: latLng,
          ),
        );
        emit(CurrentLocationSuccessState());
      },
    );
  }

  Future<void> _handleLoadReadyToDeliver(Emitter<HomeState> emit) async {
    emit(ReadyToDeliverLoadingState());

    final res = await _loadReadyToDeliverUsecase(NoParams());

    res.fold(
      (exception) => emit(ReadyToDeliverFailureState()),
      (orders) {
        readyToDeliverOrders = orders;
        emit(ReadyToDeliverSuccessState());
      },
    );
  }

  Future<void> _handleCompleteDelivery(Emitter<HomeState> emit,
      {required String orderId}) async {
    emit(DeliverOrderLoadingState());

    final didDeliver =
        await _completeDeliveryUsecase(UpdateOrderParams(orderId: orderId));

    if (didDeliver) {
      emit(DeliverOrderSuccessState());
    } else {
      emit(DeliverOrderFailureState());
    }
  }

  Future<void> _handleDrawPolyline(Emitter<HomeState> emit,
      {required LatLng destinationLatLng}) async {
    emit(PolyLineLoadingState());

    final res =
        await _drawPolylineUsecase(PolyLineParams(latLng: destinationLatLng));

    res.fold(
      (failure) => emit(PolyLineFailureState()),
      (record) async {
        final icon = await AppHelpers.setCustomMarkerIcon(
            path: ImgManager.pngMyLocation, width: 120);
        polylines.clear();
        markers.clear();

        markers.add(Marker(
            markerId: const MarkerId('destination'),
            position: record.polyline.points.last));
        markers.add(Marker(
          markerId: const MarkerId('source'),
          position: record.polyline.points[0],
          icon: icon,
        ));
        polylines.add(record.polyline);

        final mapController = await mapCompleter.future;

        mapController.animateCamera(
            CameraUpdate.newLatLngBounds(record.latLngBounds, 1.0));
      },
    );
  }

  final GetCurrentLocationUsecase _getCurrentLocation;
  final LoadReadyToDeliverUsecase _loadReadyToDeliverUsecase;
  final CompleteDeliveryUsecase _completeDeliveryUsecase;
  final DrawPolylineUsecase _drawPolylineUsecase;
  HomeBloc(
      {required GetCurrentLocationUsecase getCurrentLocation,
      required LoadReadyToDeliverUsecase loadReadyToDeliverUsecase,
      required CompleteDeliveryUsecase completDeliveryUsecase,
      required DrawPolylineUsecase drawPolylineUsecase})
      : _getCurrentLocation = getCurrentLocation,
        _loadReadyToDeliverUsecase = loadReadyToDeliverUsecase,
        _completeDeliveryUsecase = completDeliveryUsecase,
        _drawPolylineUsecase = drawPolylineUsecase,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      return switch (event) {
        GetCurrentLocationEvent() => await _handleGetCurrentLocation(emit),
        LoadReadyToDeliverEvent() => await _handleLoadReadyToDeliver(emit),
        DeliverOrderEvent() =>
          await _handleCompleteDelivery(emit, orderId: event.orderId),
        DrawPolylineEvent() =>
          _handleDrawPolyline(emit, destinationLatLng: event.destinationLatLng),
      };
    });
  }
}
