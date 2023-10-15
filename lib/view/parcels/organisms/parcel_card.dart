import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart' as intl;
import 'package:test_project/app/core/utils/theming/app_fonts.dart';
import 'package:test_project/domain/entites/parcel_entity.dart';

import '../../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../../app/core/utils/helpers/helpers.dart';
import '../../../app/core/utils/theming/app_colors.dart';
import 'parcel_details_bottomsheet.dart';

class ParcelCard extends StatelessWidget {
  final ParcelEntity parcelModel;
  final bool isntHistory;
  // final bool isSet;

  const ParcelCard({
    Key? key,
    required this.parcelModel,
    required this.isntHistory,
    // required this.isSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO
        showCustomModalBottomSheet(
          context: context,
          widget: ParcelDetailsBotttomSheet(
            parcelModel: parcelModel,
            isntHistory: isntHistory,
            // isSet: false,
          ),
          isDarkMode: false,
          // paddingTop: MediaQuery.of(context).padding.top,
          radius: 12,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "#ID${parcelModel.id}",
              style: AppFontStyles.interSemi(
                size: 16,
              ),
            ),
            16.verticalSpace,
            Text(
              parcelModel.originAddress.address,
              style: AppFontStyles.interSemi(
                size: 16,
              ),
            ),
            16.verticalSpace,
            Text(
              parcelModel.destinationAddress.address,
              style: AppFontStyles.interSemi(
                size: 16,
              ),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppHelpers.numberFormat(
                          isOrder: parcelModel.currencySymbol.isNotEmpty,
                          symbol: parcelModel.currencySymbol,
                          number: parcelModel.totalPrice),
                      style: AppFontStyles.interNormal(
                        size: 16,
                      ),
                    ),
                    6.verticalSpace,
                    Text(
                      intl.DateFormat("MMM dd, HH:mm")
                          .format(DateTime.parse(parcelModel.createdAt)),
                      style: AppFontStyles.interRegular(
                        size: 12,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
