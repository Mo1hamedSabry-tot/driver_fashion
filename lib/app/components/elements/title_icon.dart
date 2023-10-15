import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/theming/app_colors.dart';
import '../../core/utils/theming/app_fonts.dart';

class TitleAndIcon extends StatelessWidget {
  final String title;
  final double? titleSize;
  final String? rightTitle;
  final bool hasIcon;
  final Color rightTitleColor;
  final Color textColor;
  final bool isLtr;
  final VoidCallback? onRightTap;

  const TitleAndIcon({
    Key? key,
    this.hasIcon = false,
    this.isLtr = true,
    required this.title,
    this.rightTitle,
    this.rightTitleColor = AppColors.blackColor,
    this.textColor = AppColors.blackColor,
    this.onRightTap,
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFontStyles.interSemi(
                size: titleSize ?? 18.sp,
                color: textColor,
              ),
            ),
          ),
          GestureDetector(
            onTap: onRightTap ?? () {},
            child: Row(
              children: [
                Text(
                  rightTitle ?? "",
                  style: AppFontStyles.interRegular(
                    size: 14.sp,
                    color: rightTitleColor,
                  ),
                ),
                hasIcon
                    ? Icon(isLtr
                        ? Icons.keyboard_arrow_right
                        : Icons.keyboard_arrow_left)
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
