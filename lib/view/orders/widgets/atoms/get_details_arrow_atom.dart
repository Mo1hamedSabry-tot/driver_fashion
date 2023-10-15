import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/core/utils/theming/app_colors.dart';

class GetDetailsArrowAtom extends StatelessWidget {
  const GetDetailsArrowAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: const BoxDecoration(
          color: AppColors.greyColor, shape: BoxShape.circle),
      child: const Icon(FlutterRemix.arrow_right_s_line),
    );
  }
}
