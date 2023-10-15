import 'package:google_maps_flutter/google_maps_flutter.dart';

extension ToDomain on List<LatLng> {
  Polyline toDomain({String? polyLineId}) {
    return Polyline(
      polylineId: PolylineId(polyLineId ?? "route"),
      points: this,
    );
  }
}
