import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Tab> tabs;
  final bool scroll;

  const CustomTabBar(
      {Key? key,
      required this.tabController,
      required this.tabs,
      this.scroll = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(6),
      height: 48.h,
      decoration: BoxDecoration(
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.tabBarBorderColor)),
      child: TabBar(
          isScrollable: scroll,
          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.blackColor),
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.textColor,
          unselectedLabelStyle: AppFontStyles.interRegular(size: 14.sp),
          labelStyle: AppFontStyles.interSemi(size: 14.sp),
          tabs: tabs),
    );
  }
}
