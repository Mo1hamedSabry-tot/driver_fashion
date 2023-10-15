import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

import '../../core/utils/theming/app_colors.dart';
import '../../core/utils/theming/app_fonts.dart';
import '../../../domain/entites/parcel_entity.dart';
import 'bottom_sheet/show_custom_bottom_sheet.dart';
import '../organisms/available_maps.dart';

class ParcelDetailsMolecule extends StatelessWidget {
  const ParcelDetailsMolecule({
    super.key,
    required this.parcelModel,
  });

  final ParcelEntity parcelModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 180,
                  child: Text(
                    parcelModel.originAddress.address ?? "",
                    style:
                        AppFontStyles.interSemi(size: 14, letterSpacing: -0.3),
                  ),
                ),
                2.verticalSpace,
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text(
                        "№ ${parcelModel.id}",
                        style: AppFontStyles.interNormal(
                            size: 14, letterSpacing: -0.3),
                      ),
                      const VerticalDivider(),
                      Text(
                        intl.DateFormat("hh:mm").format(DateTime.parse(
                            parcelModel.updatedAt ??
                                DateTime.now().toString())),
                        style: AppFontStyles.interNormal(
                            size: 14, letterSpacing: -0.3),
                      ),
                      16.horizontalSpace,
                      const Icon(
                        FlutterRemix.building_fill,
                        size: 18,
                      ),
                      IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        onPressed: () async {
                          showCustomModalBottomSheet(
                              context: context,
                              widget: AvailableMaps(
                                  location: Coords(
                                    parcelModel.originAddress.lat ?? 0,
                                    parcelModel.originAddress.lng ?? 0,
                                  ),
                                  title: "A"),
                              isDarkMode: false);
                        },
                        icon: const Icon(
                          FlutterRemix.map_2_fill,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: parcelModel.originPhone ?? "",
                    );
                    await launchUrl(launchUri);
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor, shape: BoxShape.circle),
                    margin: const EdgeInsets.all(4),
                    child: const Icon(
                      FlutterRemix.phone_fill,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'sms',
                      path: parcelModel.originPhone ?? "",
                    );
                    await launchUrl(launchUri);
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor, shape: BoxShape.circle),
                    margin: const EdgeInsets.all(4),
                    child: const Icon(
                      FlutterRemix.chat_1_fill,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        24.verticalSpace,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            16.horizontalSpace,
            SizedBox(
              width: MediaQuery.of(context).size.width - 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 190,
                    child: Text(
                      parcelModel.destinationAddress.address ?? "",
                      style: AppFontStyles.interSemi(
                          size: 14, letterSpacing: -0.3),
                      maxLines: 1,
                    ),
                  ),
                  2.verticalSpace,
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            parcelModel.destinationUsername ?? "",
                            style: AppFontStyles.interNormal(
                                size: 12, letterSpacing: -0.3),
                          ),
                        ),
                        const VerticalDivider(),
                        Text(
                          parcelModel.destinationPhone ?? "",
                          style: AppFontStyles.interNormal(
                              size: 12, letterSpacing: -0.3),
                        ),
                        IconButton(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          onPressed: () {
                            showCustomModalBottomSheet(
                                context: context,
                                widget: AvailableMaps(
                                    location: Coords(
                                      parcelModel.destinationAddress.lat ?? 0,
                                      parcelModel.destinationAddress.lng ?? 0,
                                    ),
                                    title: "B"),
                                isDarkMode: false);
                          },
                          icon: const Icon(
                            FlutterRemix.map_2_fill,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'tel',
                      path: parcelModel.destinationPhone ?? "",
                    );
                    await launchUrl(launchUri);
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor, shape: BoxShape.circle),
                    margin: const EdgeInsets.all(4),
                    child: const Icon(
                      FlutterRemix.phone_fill,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final Uri launchUri = Uri(
                      scheme: 'sms',
                      path: parcelModel.destinationPhone ?? "",
                    );
                    await launchUrl(launchUri);
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                        color: AppColors.blackColor, shape: BoxShape.circle),
                    margin: const EdgeInsets.all(4),
                    child: const Icon(
                      FlutterRemix.chat_1_fill,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
