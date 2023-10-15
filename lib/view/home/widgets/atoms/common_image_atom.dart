import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/core/utils/extensions/is_svg_extension.dart';
import '../../../../app/core/utils/theming/app_colors.dart';

class CommonImageAtom extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final Color? errorBackground;
  final BoxFit? fit;

  const CommonImageAtom({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 10,
    this.errorBackground,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: imageUrl.isSvg()
          ? SvgPicture.network(
              imageUrl ?? "",
              width: width,
              height: height,
              fit: BoxFit.cover,
              placeholderBuilder: (_) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: AppColors.white,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: imageUrl ?? "",
              width: width,
              height: height,
              fit: fit ?? BoxFit.fill,
              progressIndicatorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: AppColors.white,
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: errorBackground ?? AppColors.textColor, //Colors.grey
                ),
                alignment: Alignment.center,
                child: Icon(
                  FlutterRemix.image_line,
                  color: AppColors.blackColor.withOpacity(0.5),
                  size: 2,
                ),
              ),
            ),
    );
  }
}
