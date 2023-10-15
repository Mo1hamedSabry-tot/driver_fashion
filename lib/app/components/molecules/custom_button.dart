import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';

import '../../core/utils/theming/app_fonts.dart';
import '../atoms/buttons_bouncing_effect.dart';

class CustomButton extends StatelessWidget {
  final Widget? icon;
  final String title;
  final bool isLoading;
  final Function()? onPressed;
  final Color? background;
  final Color borderColor;
  final Color textColor;
  final double? width;
  final double radius;
  final TextStyle? textStyle;

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isLoading = false,
    this.background,
    this.textColor = AppColors.white,
    this.width, // = double.infinity,
    this.radius = 10,
    this.icon,
    this.borderColor = AppColors.transparent,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingEffect(
      child: GestureDetector(
        onTap: isLoading ? null : onPressed,
        child: Container(
          width: width,
          height: 48.h,
          decoration: BoxDecoration(
            color: background ?? AppColors.primaryColor,
            border: Border.all(
              color: borderColor == Colors.transparent
                  ? background ?? AppColors.primaryColor
                  : borderColor, //TODO
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(radius),
          ),
          alignment: Alignment.center,
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        strokeWidth: 3, color: AppColors.white),
                  ),
                )
              : (icon == null
                  ? Text(
                      title,
                      style: textStyle ??
                          GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: textColor,
                            // background == Style.primaryColor
                            //     ? Style.white
                            //     : textColor,
                            letterSpacing: -14 * 0.01,
                          ),
                    )
                  : Text(
                      title,
                      style: textStyle ??
                          AppFontStyles.interSemi(
                            size: 20.sp,
                            color: textColor,
                          ),
                    )),
        ),
      ),
    );
  }
}
