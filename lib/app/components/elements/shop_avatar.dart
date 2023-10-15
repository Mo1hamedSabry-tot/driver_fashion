import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/utils/theming/app_colors.dart';

class ShopAvatar extends StatelessWidget {
  final double size;
  final double padding;
  final double radius;
  final Color bgColor;
  final String? imageUrl;
  final String? path;

  const ShopAvatar({
    Key? key,
    required this.size,
    required this.padding,
    this.bgColor = AppColors.blackColorOpacity,
    this.radius = 10,
    this.imageUrl,
    this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          width: size,
          height: size,
          color: bgColor,
          padding: EdgeInsets.all(padding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size / 2),
            child: imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: '$imageUrl',
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) {
                      return Shimmer.fromColors(
                        baseColor: AppColors.shimmerBase,
                        highlightColor: AppColors.shimmerHighlight,
                        child: Container(
                          height: size,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(size / 2),
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
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
                  )
                : path != null
                    ? Image.file(
                        File(path!),
                        width: size,
                        height: size,
                        fit: BoxFit.cover,
                      )
                    : null,
          ),
        ),
      ),
    );
  }
}
