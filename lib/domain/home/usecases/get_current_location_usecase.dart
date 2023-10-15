import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../app/core/network/error/failure.dart';
import '../../../app/core/usecase/usecase.dart';
import '../repos/map_repo.dart';

class GetCurrentLocationUsecase
    implements BaseUsecase<Future<Either<Failure, LatLng>>, NoParams> {
  final MapRepo _mapRepo;

  GetCurrentLocationUsecase({required MapRepo mapRepo}) : _mapRepo = mapRepo;

  @override
  Future<Either<Failure, LatLng>> call(NoParams params) async {
    return await _mapRepo.getCurrentLocation();
  }
}
