import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';

class BenefitMolecule extends StatelessWidget {
  const BenefitMolecule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.pushRoute(const OrdersRoute());
      },
      child: Container(
        height: 64.h,
        width: (MediaQuery.of(context).size.width - 42) / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.primaryColor),
        ),
        padding: REdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.blackColor,
              ),
              child: const Icon(
                FlutterRemix.file_list_2_fill,
                color: AppColors.white,
              ),
            ),
            14.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.verticalSpace,
                SizedBox(
                  width: 60.w,
                  child: Text(
                    AppStrings.tot,
                    style: AppFontStyles.interNormal(
                        size: 12.sp, letterSpacing: -0.3),
                    maxLines: 1,
                  ),
                ),
                Text(
                  "\$8,866.61",
                  style:
                      AppFontStyles.interSemi(size: 14.sp, letterSpacing: -0.3),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
