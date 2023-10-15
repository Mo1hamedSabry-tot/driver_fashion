import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/core/utils/theming/app_colors.dart';

class ForgetPasswrodAtom extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? fontSize;
  final Color? fontColor;
  final double? letterSpacing;

  const ForgetPasswrodAtom({
    Key? key,
    required this.title,
    required this.onPressed,
    this.fontSize,
    this.fontColor = AppColors.blackColor,
    this.letterSpacing = -14 * 0.02,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateColor.resolveWith(
          (states) => AppColors.greyColor,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: GoogleFonts.inter(
          letterSpacing: letterSpacing,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
          fontSize: fontSize ?? 12.sp,
          color: fontColor,
        ),
      ),
    );
  }
}
