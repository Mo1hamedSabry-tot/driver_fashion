import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:test_project/app/components/organisms/available_maps.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';

class MapIcon extends StatelessWidget {
  final LatLng latLng;
  final String title;
  final VoidCallback? onTap;

  const MapIcon({
    super.key,
    required this.latLng,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            showCustomModalBottomSheet(
                context: context,
                widget: AvailableMaps(
                    location: Coords(
                      latLng.latitude,
                      latLng.longitude,
                    ),
                    title: title),
                isDarkMode: false);
          },
      child: Icon(
        FlutterRemix.map_2_fill,
        size: 18.sp,
      ),
    );
    // IconButton(
    //   padding: const EdgeInsets.symmetric(horizontal: 6),
    // onPressed: () {
    //   showCustomModalBottomSheet(
    //       context: context,
    //       widget: AvailableMaps(
    //           location: Coords(
    //             latLng.latitude,
    //             latLng.longitude,
    //           ),
    //           title: title),
    //       isDarkMode: false);
    // },
    //   icon: ,
    // );
  }
}
