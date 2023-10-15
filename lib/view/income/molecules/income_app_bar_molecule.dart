import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/components/elements/list_appbar.dart';

import '../../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../../app/components/templates/filter_bottom_sheet.dart';
import '../../../app/core/utils/theming/app_colors.dart';
import '../../../app/core/utils/theming/app_fonts.dart';
import '../../../app/core/utils/value_managers/app_strings.dart';

class IncomeAppBar extends StatelessWidget {
  const IncomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListAppBar(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppStrings.income,
              style: AppFontStyles.interSemi(size: 18.sp),
            ),
            Text(
              AppStrings.earnings,
              style:
                  AppFontStyles.interRegular(size: 12.sp, letterSpacing: -0.3),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            showCustomModalBottomSheet(
                // paddingTop: MediaQuery.of(context).padding.top,
                context: context,
                radius: 12,
                widget: const FilterBottomSheet(
                  isTabBar: false,
                ),
                isDarkMode: true);
          },
          child: Container(
            padding: EdgeInsets.all(10.r),
            decoration: const BoxDecoration(
                color: AppColors.greyColor, shape: BoxShape.circle),
            child: const Icon(
              FlutterRemix.calendar_event_fill,
              color: AppColors.blackColor,
            ),
          ),
        )
      ],
    ));
  }
}
