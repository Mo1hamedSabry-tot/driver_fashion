import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/atoms/buttons_bouncing_effect.dart';
import '../../../../app/core/utils/theming/app_colors.dart';

class GetMyLocationAtom extends StatelessWidget {
  GetMyLocationAtom({
    super.key,
    this.onTap,
  });

  final length = 48.w;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: length,
          height: length,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.textColor,
                blurRadius: 5.r,
                spreadRadius: 1.r,
              )
            ],
          ),
          child: const Icon(FlutterRemix.focus_3_fill),
        ),
      ),
    );
  }
}
