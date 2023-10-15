import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppFontStyles {
  static interBold({
    double size = 18,
    Color color = AppColors.blackColor,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
        decoration: TextDecoration.none,
        letterSpacing: letterSpacing,
      );

  static interSemi({
    double size = 18,
    Color color = AppColors.blackColor,
    TextDecoration decoration = TextDecoration.none,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle interNormal({
    double size = 16,
    Color color = AppColors.blackColor,
    double letterSpacing = 0,
    TextDecoration textDecoration = TextDecoration.none,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      );

  static interRegular({
    double size = 16,
    Color color = AppColors.blackColor,
    double letterSpacing = 0,
    TextDecoration textDecoration = TextDecoration.none,
    FontStyle? fontStyle,
  }) =>
      GoogleFonts.inter(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        fontStyle: fontStyle,
      );
}
