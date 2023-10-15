import 'package:flutter/material.dart';

import '../../core/utils/theming/app_colors.dart';

class DotAtom extends StatelessWidget {
  const DotAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      margin: const EdgeInsets.only(
        bottom: 6,
      ),
      decoration: const BoxDecoration(
          color: AppColors.toggleColor, shape: BoxShape.circle),
    );
  }
}
