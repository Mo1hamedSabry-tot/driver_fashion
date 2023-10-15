import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/assets_manager.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';

class BalanceMolecule extends StatelessWidget {
  final String balance;
  const BalanceMolecule({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppHelpers.showAlertDialog(
        //   context: context,
        //   child:  PushOrder(),
        // );
      },
      child: Container(
        height: 64,
        width: (MediaQuery.of(context).size.width - 42) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        padding: REdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            SvgPicture.asset(
              ImgManager.svgBalance,
              // theme: SvgTheme(
              //   currentColor: AppColors.primaryColor,
              // ),
            ),
            14.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.balance,
                  style: AppFontStyles.interNormal(
                      size: 12.sp, letterSpacing: -0.3),
                ),
                Text(
                  balance,
                  style:
                      AppFontStyles.interSemi(size: 14.sp, letterSpacing: -0.3),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
