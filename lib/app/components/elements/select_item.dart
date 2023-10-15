import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/theming/app_colors.dart';
import '../atoms/buttons_bouncing_effect.dart';

class SelectItem extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final Color activeColor;
  final Color textColor;
  final String title;

  const SelectItem(
      {Key? key,
      required this.onTap,
      required this.isActive,
      required this.title,
      required this.activeColor,
      this.textColor = AppColors.blackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingEffect(
      child: Padding(
        padding: REdgeInsets.only(bottom: 8),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: REdgeInsets.all(18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 18.w,
                    height: 18.w,
                    decoration: BoxDecoration(
                      color: isActive ? activeColor : AppColors.transparent,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isActive ? AppColors.blackColor : textColor,
                          width: isActive ? 4.w : 2.w),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
