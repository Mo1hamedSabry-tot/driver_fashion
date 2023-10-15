import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../core/utils/theming/app_colors.dart';

class FilterIconButton extends StatelessWidget {
  final VoidCallback onTap;

  const FilterIconButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryColor,
        ),
        padding: const EdgeInsets.all(16),
        child: const Icon(FlutterRemix.equalizer_fill),
      ),
    );
  }
}
