import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_project/data/home/mappers/latlng_list_to_polyline.dart';
import 'package:test_project/data/home/mappers/position_to_latlng.dart';

import '../../../app/core/network/error/exception.dart';
import '../../../app/core/network/error/failure.dart';
import '../../../domain/home/repos/map_repo.dart';
import '../data_sources/map/local_data_source.dart';
import '../data_sources/map/remote_data_source.dart';

class MapRepoImpl implements MapRepo {
  final MapLocalDataSource _localDataSource;
  final MapRemoteDataSource _remoteDataSource;

  MapRepoImpl(
      {required MapLocalDataSource localDataSource,
      required MapRemoteDataSource remoteDataSource})
      : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, LatLng>> getCurrentLocation() async {
    try {
      final pos = await _localDataSource.getCurrentPosition();
      return Right(pos.toDomain());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ({Polyline polyline, LatLngBounds latLngBounds})>>
      drawLine({required LatLng destinationLatLng}) async {
    final currentPos = await getCurrentLocation();

    return currentPos.fold(
      (localFailure) => Left(localFailure),
      (currentLatLng) async {
        final pointsRes = await _remoteDataSource.getPolyPointsAndBbox(
            sourceLatLng: currentLatLng, destinationLatLng: destinationLatLng);
        return pointsRes.fold(
          (remoteFailure) => Left(remoteFailure),
          (record) {
            final polyline = record.polyPoints.toDomain();
            final latLngBounds = record.latLngBounds;
            return Right((polyline: polyline, latLngBounds: latLngBounds));
          },
        );
      },
    );
  }
}
