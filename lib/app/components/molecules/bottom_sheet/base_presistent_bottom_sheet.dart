import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/theming/app_colors.dart';

class BasePresistentBottomSheet extends StatelessWidget {
  final Widget child;
  final double height;

  const BasePresistentBottomSheet(
      {Key? key, required this.height, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.greyColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.r),
          topLeft: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 40.r,
            offset: const Offset(0, -2),
          )
        ],
      ),
      padding: REdgeInsets.only(
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 16,
        right: 16,
      ),
      child: child,
    );
  }
}
