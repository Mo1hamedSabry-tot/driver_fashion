import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';

import '../../core/utils/theming/app_colors.dart';
import '../atoms/buttons_bouncing_effect.dart';

class AvailableMaps extends StatefulWidget {
  final Coords location;
  final String title;

  const AvailableMaps({Key? key, required this.location, required this.title})
      : super(key: key);

  @override
  State<AvailableMaps> createState() => _AvailableMapsState();
}

class _AvailableMapsState extends State<AvailableMaps> {
  List<AvailableMap> availableMaps = [];

  @override
  void initState() {
    installedMaps();
    super.initState();
  }

  installedMaps() async {
    availableMaps = await MapLauncher.installedMaps;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: availableMaps.length,
        itemBuilder: (context, index) {
          return BouncingEffect(
            child: Container(
              margin: REdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: ListTile(
                onTap: () {
                  availableMaps[index].showMarker(
                    coords: widget.location,
                    title: widget.title,
                  );
                },
                title: Text(availableMaps[index].mapName),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: SvgPicture.asset(
                    availableMaps[index].icon,
                    height: 30.0.h,
                    width: 30.0.h,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
