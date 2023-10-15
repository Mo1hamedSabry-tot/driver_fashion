import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension ToDomain on Position {
  LatLng toDomain() {
    return LatLng(latitude, longitude);
  }
}
