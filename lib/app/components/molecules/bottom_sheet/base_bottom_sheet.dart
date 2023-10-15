import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/theming/app_colors.dart';
import '../../atoms/keyboard_disable_atom.dart';

class BaseBottomSheet extends StatelessWidget {
  final Widget child;
  final double? height;
  final Color backgroundColor;

  const BaseBottomSheet(
      {super.key,
      required this.child,
      this.height,
      this.backgroundColor = AppColors.greyColor});

  @override
  Widget build(BuildContext context) {
    final radius = 16.r;
    final padding = 16.w;
    return KeyboardDisableAtom(
      child: Container(
        margin: MediaQuery.of(context).viewInsets,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        ),
        child: Padding(
          padding: REdgeInsets.all(padding
              // top: padding,
              // left: padding,
              // bottom: padding,
              ),
          child: child,
        ),
      ),
    );
  }
}
