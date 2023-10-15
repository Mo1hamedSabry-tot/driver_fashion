import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/core/utils/theming/app_colors.dart';

class BadgeIconAtom extends StatelessWidget {
  final String count;

  const BadgeIconAtom({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        color: AppColors.white,
        fontSize: 18.sp,
      ),
    );
  }
}
