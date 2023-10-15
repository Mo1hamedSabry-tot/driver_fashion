import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/core/usecase/usecase.dart';
import '../../../app/core/utils/value_managers/app_strings.dart';
import '../../../domain/entites/order_details_entity.dart';
import '../../../domain/orders/usecases/load_orders_usecase.dart';
import '../../../domain/orders/usecases/pickup_order_usecase.dart';
import '../../../domain/orders/usecases/ready_to_deliver_usecase.dart';
import '../../../domain/orders/usecases/shared_params/update_order_params.dart';
part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  List<OrderDetailsEntity> pickedOrders = [];
  List<OrderDetailsEntity> availableOrders = [];
  int totalOrders = 0;

  Future<void> _handleLoadOrders({required Emitter<OrdersState> emit}) async {
    emit(OrdersLoadingState());

    final res = await _loadOrdersUsecase(NoParams());

    res.fold(
      (exception) => emit(OrdersFailureState()),
      (orders) {
        availableOrders = orders.availableOrders;
        pickedOrders = orders.pickedOrders;

        totalOrders = availableOrders.length + pickedOrders.length;
        emit(OrdersSuccessState());
      },
    );
  }

  Future<void> _handlePickupOrder(
      {required Emitter<OrdersState> emit, required String orderId}) async {
    emit(PickupOrderLoadingState());

    final didSucceed =
        await _updateOrderUsecase(UpdateOrderParams(orderId: orderId));

    didSucceed
        ? emit(const PickupOrderSuccessState())
        : emit(const PickupOrderFailureState());
  }

  Future<void> _handleReadyToDeliver(Emitter<OrdersState> emit,
      {required String orderId}) async {
    emit(ReadToDeliverOrderLoadingState());

    final res =
        await _readyToDeliverUsecase(UpdateOrderParams(orderId: orderId));

    emit(res
        ? const ReadyToDeliverOrderSuccessState()
        : const ReadToDeliverOrderFailureState());
  }

  final LoadOrdersUsecase _loadOrdersUsecase;
  final PickupOrderUsecase _updateOrderUsecase;
  final ReadyToDeliverUsecase _readyToDeliverUsecase;
  OrdersBloc({
    required LoadOrdersUsecase loadActiveOrdersUsecase,
    required PickupOrderUsecase updateOrderUsecase,
    required ReadyToDeliverUsecase readyToDeliverUsecase,
  })  : _loadOrdersUsecase = loadActiveOrdersUsecase,
        _updateOrderUsecase = updateOrderUsecase,
        _readyToDeliverUsecase = readyToDeliverUsecase,
        super(OrdersInitial()) {
    on<OrdersEvent>((event, emit) async {
      return switch (event) {
        LoadOrdersEvent() => await _handleLoadOrders(emit: emit),
        PickupOrderEvent() =>
          await _handlePickupOrder(emit: emit, orderId: event.orderId),
        ReadyToDeliverEvent() =>
          await _handleReadyToDeliver(emit, orderId: event.orderId),
      };
    });
  }
}
