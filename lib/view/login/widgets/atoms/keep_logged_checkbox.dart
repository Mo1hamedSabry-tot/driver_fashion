import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';

class KeepLoggedCheckbox extends StatelessWidget {
  final double length;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const KeepLoggedCheckbox({
    super.key,
    required this.length,
    this.isChecked = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: length,
      width: length,
      child: Checkbox(
        side: BorderSide(
          color: AppColors.blackColor,
          width: 2.w,
        ),
        activeColor: AppColors.blackColor,
        value: isChecked,
        onChanged: onChanged,
      ),
    );
  }
}
