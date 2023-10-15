import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/atoms/buttons_bouncing_effect.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';

class SectionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const SectionItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 4.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Icon(icon),
              16.horizontalSpace,
              Text(
                title,
                style: AppFontStyles.interRegular(
                    size: 15.sp, color: AppColors.blackColor),
              ),
              const Spacer(),
              const Icon(
                FlutterRemix.arrow_right_s_line,
                color: AppColors.tabBarBorderColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
