import 'package:flutter/material.dart';

import '../../../../app/core/utils/theming/app_colors.dart';

class StoryIndicator extends StatelessWidget {
  const StoryIndicator({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.controller,
    required this.width,
  });

  final int index;
  final int currentIndex;
  final AnimationController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 8),
      height: 4,
      width: width,
      decoration: BoxDecoration(
        color: currentIndex >= index ? AppColors.primaryColor : AppColors.white,
        borderRadius: BorderRadius.circular(122),
      ),
      duration: const Duration(milliseconds: 500),
      child: currentIndex == index
          ? ClipRRect(
              borderRadius: BorderRadius.circular(122),
              child: LinearProgressIndicator(
                value: controller.value,
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 24, 26, 25)),
                backgroundColor: AppColors.white,
              ),
            )
          : currentIndex > index
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(122),
                  child: LinearProgressIndicator(
                    value: 1,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    backgroundColor: AppColors.white,
                  ),
                )
              : const SizedBox.shrink(),
    );
  }
}
