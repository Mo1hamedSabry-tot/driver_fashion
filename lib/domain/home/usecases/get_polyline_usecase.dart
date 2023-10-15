import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/core/network/error/failure.dart';
import '../../../app/core/usecase/usecase.dart';
import '../repos/map_repo.dart';

class DrawPolylineUsecase
    extends BaseUsecase<Future<Either<Failure, ({Polyline polyline, LatLngBounds latLngBounds})>>, PolyLineParams> {
  final MapRepo _mapRepo;

  DrawPolylineUsecase({required MapRepo mapRepo}) : _mapRepo = mapRepo;

  @override
  Future<Either<Failure, ({Polyline polyline, LatLngBounds latLngBounds})>> call(params) async {
    return await _mapRepo.drawLine(destinationLatLng: params.latLng);
  }
}

class PolyLineParams extends Equatable {
  final LatLng latLng;

  const PolyLineParams({required this.latLng});

  @override
  List<Object?> get props => [latLng];
}
