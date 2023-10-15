import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../../../app/components/atoms/image_shimmer_atom.dart';
import '../../../../app/core/utils/theming/app_colors.dart';

class OrderPartyImageMolecule extends StatelessWidget {
  const OrderPartyImageMolecule({
    super.key,
    required this.img,
    this.isCircle = true,
    this.shimmerSize = 32,
    this.imgHeight = 32,
    this.imgWidth = 32,
  });

  final String? img;
  final bool isCircle;
  final double shimmerSize;
  final double imgHeight;
  final double imgWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imgHeight,
      width: imgWidth,
      decoration: BoxDecoration(
          color: AppColors.white,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle),
      child: isCircle
          ? ClipOval(
              child: CustomCachedNetworkImage(
                  img: img, isCircel: isCircle, shimmerSize: shimmerSize),
            )
          : CustomCachedNetworkImage(
              img: img, isCircel: isCircle, shimmerSize: shimmerSize),
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.img,
    required this.isCircel,
    required this.shimmerSize,
  });

  final String? img;
  final bool isCircel;
  final double shimmerSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: img ?? "",
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) {
        return ImageShimmerAtom(
          isCircle: isCircel,
          size: shimmerSize,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          // height: 32,
          // width: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greyColor,
          ),
          alignment: Alignment.center,
          child: const Icon(
            FlutterRemix.image_line,
            color: AppColors.blackColor,
          ),
        );
      },
    );
  }
}
