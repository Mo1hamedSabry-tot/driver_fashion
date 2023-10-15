import 'package:flutter/material.dart';

import '../../../../app/core/utils/theming/app_colors.dart';

class StoryNavigationMolecule extends StatelessWidget {
  const StoryNavigationMolecule({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            pageController.previousPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            color: AppColors.transparent,
          ),
        ),
        GestureDetector(
          onTap: () {
            pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            color: AppColors.transparent,
          ),
        ),
      ],
    );
  }
}
