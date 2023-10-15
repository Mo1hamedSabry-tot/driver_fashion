import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapOrganism extends StatelessWidget {
  final BitmapDescriptor markerIcon;
  final Set<Polyline> polyLines;
  final Set<Marker> markers;
  final Completer<GoogleMapController> mapController;

  const GoogleMapOrganism(
      {super.key,
      required this.mapController,
      this.markers = const {},
      this.polyLines = const {},
      this.markerIcon = BitmapDescriptor.defaultMarker});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      initialCameraPosition: const CameraPosition(
        bearing: 0,
        target: LatLng(37.42796133580664, -122.085749655962),
        tilt: 0,
        zoom: 17,
      ),
      markers: markers,
      polylines: polyLines,
      mapToolbarEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: (controller) {
        if (!mapController.isCompleted) {
          mapController.complete(controller);
        }
      },
      onTap: (latLng) {
        if (kDebugMode) {
          print(latLng);
        }
      },
      onCameraMoveStarted: () {},
      onCameraIdle: () {
        // _delayed.run(() {
        //   ref.read(homeProvider.notifier).scrolling(false);
        // });
      },
      padding: const EdgeInsets.only(
        bottom: 90,
        // ref.watch(homeProvider).isGoRestaurant
        //     ? 90
        //     : ref.watch(homeProvider).isScrolling
        //         ? 60
        //         : 330,
      ),
    );
  }
}
