import 'package:flutter/material.dart';
import 'package:test_project/app/components/atoms/buttons_bouncing_effect.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';

class PopButton extends StatelessWidget {
  const PopButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingEffect(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(12),
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
