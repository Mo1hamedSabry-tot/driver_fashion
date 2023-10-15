import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/core/network/error/failure.dart';

abstract class MapRepo {
  Future<Either<Failure, LatLng>> getCurrentLocation();
  Future<Either<Failure, ({Polyline polyline, LatLngBounds latLngBounds})>> drawLine(
      {required LatLng destinationLatLng});
}
