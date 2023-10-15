import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app/core/network/api/api_consumer.dart';
import '../../../../app/core/network/error/failure.dart';
import '../../../../app/core/utils/shared/shared.dart';

abstract class MapRemoteDataSource {
  Future<
          Either<Failure,
              ({List<LatLng> polyPoints, LatLngBounds latLngBounds})>>
      getPolyPointsAndBbox(
          {required LatLng sourceLatLng, required LatLng destinationLatLng});
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final ApiConsumer _apiConsumer;

  MapRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<
          Either<Failure,
              ({List<LatLng> polyPoints, LatLngBounds latLngBounds})>>
      getPolyPointsAndBbox(
          {required LatLng sourceLatLng,
          required LatLng destinationLatLng}) async {
    final res = await _apiConsumer.get(path: '', queryParameters: {
      "api_key": Shared().routingKey,
      "start":
          "8.681495,49.41461", //"${sourceLatLng.latitude},${sourceLatLng.longitude}",
      "end":
          "8.687872,49.420318", //"${destinationLatLng.latitude},${destinationLatLng.longitude}",
    });

    return res.fold(
      (failure) => Left(ServerFailure()),
      (data) {
        List<LatLng> latLngs = [];
        log("::: $data :::");
        final feature = data["features"][0];
        final List coordsList = feature["geometry"]["coordinates"];

        for (final coord in coordsList) {
          final latLng = LatLng(coord[0], coord[1]);

          latLngs.add(latLng);
        }
        final bbox = feature["bbox"];
        final southWest = LatLng(bbox[0], bbox[1]);
        final northEast = LatLng(bbox[2], bbox[3]);

        return Right((
          polyPoints: latLngs,
          latLngBounds: LatLngBounds(
            southwest: southWest,
            northeast: northEast,
          )
        ));
      },
    );
  }
}
