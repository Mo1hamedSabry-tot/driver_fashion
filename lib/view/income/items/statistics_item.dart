import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';

import '../../../app/core/utils/theming/app_colors.dart';

class StatisticsItem extends StatelessWidget {
  final String title;
  final int count;
  final double percentage;
  final Color backgroundColor;
  final Color textColor;

  const StatisticsItem({
    Key? key,
    required this.title,
    required this.count,
    required this.percentage,
    this.backgroundColor = AppColors.white,
    this.textColor = AppColors.blackColor,
  })  : assert(percentage <= 100 && percentage >= 0),
        assert(count >= 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: (MediaQuery.of(context).size.width - 140.w) / 2,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFontStyles.interNormal(
                size: 12.sp, color: textColor, letterSpacing: -0.3),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                count.toString(),
                style: AppFontStyles.interSemi(
                    size: 14.sp, color: textColor, letterSpacing: -0.6),
              ),
              Container(
                width: 6.r,
                height: 6.r,
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (backgroundColor != AppColors.white)
                        ? AppColors.greyColor.withOpacity(0.54)
                        : AppColors.statisticsItemGrey),
              ),
              Text(
                "$percentage%",
                style: AppFontStyles.interSemi(
                    size: 14.sp, color: textColor, letterSpacing: -0.6),
              ),
            ],
          )
        ],
      ),
    );
  }
}
