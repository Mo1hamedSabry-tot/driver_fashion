import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/core/utils/helpers/helpers.dart';
import '../../../app/core/utils/theming/app_colors.dart';
import '../../../app/core/utils/theming/app_fonts.dart';
import '../../../app/core/utils/value_managers/app_strings.dart';

class LastOrderMolecule extends StatelessWidget {
  final double lastOrderPrice;
  final double lastOrderIncome;

  const LastOrderMolecule({
    super.key,
    required this.lastOrderIncome,
    required this.lastOrderPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.lastOrderPrice,
            style: AppFontStyles.interNormal(
                size: 14.sp, color: AppColors.blackColor, letterSpacing: -0.3),
          ),
          16.verticalSpace,
          Text(
            AppHelpers.numberFormat(number: lastOrderPrice),
            style: AppFontStyles.interSemi(
                size: 32.sp, color: AppColors.blackColor, letterSpacing: -0.3),
          ),
          4.verticalSpace,
          RichText(
            text: TextSpan(
              text: "${AppStrings.lastIncome}: ",
              style: AppFontStyles.interNormal(
                  size: 12.sp,
                  color: AppColors.blackColor,
                  letterSpacing: -0.3),
              children: [
                TextSpan(
                  text: AppHelpers.numberFormat(number: lastOrderIncome),
                  style: AppFontStyles.interSemi(
                      size: 12.sp,
                      color: AppColors.blackColor,
                      letterSpacing: -0.3),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
