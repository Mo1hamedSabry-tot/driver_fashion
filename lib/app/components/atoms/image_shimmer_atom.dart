import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/theming/app_colors.dart';

class ImageShimmerAtom extends StatelessWidget {
  final double size;
  final bool isCircle;

  const ImageShimmerAtom({
    Key? key,
    required this.size,
    required this.isCircle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: Colors.white,
        ),
      ),
    );
  }
}
