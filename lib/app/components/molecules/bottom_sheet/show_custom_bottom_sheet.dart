import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/theming/app_colors.dart';

void showCustomModalBottomSheet({
  required BuildContext context,
  required Widget widget,
  required bool isDarkMode,
  double? radius,
  bool isDrag = true,
}) {
  radius ??= 16.r;

  showModalBottomSheet(
    enableDrag: isDrag,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        topRight: Radius.circular(radius),
      ),
    ),
    isScrollControlled: true,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
    ),
    backgroundColor: AppColors.transparent,
    context: context,
    builder: (context) => widget,
  );
}
