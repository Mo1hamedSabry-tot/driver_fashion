import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../../../app/components/atoms/image_shimmer_atom.dart';
import '../../../../app/core/utils/theming/app_colors.dart';

class StoresCardMolecule extends StatelessWidget {
  final String img;
  final VoidCallback onTap;
  const StoresCardMolecule({Key? key, required this.img, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 176,
        width: 100,
        margin: const EdgeInsets.only(left: 8),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor.withOpacity(0),
              AppColors.primaryColor.withOpacity(0.8)
            ],
          ),
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CachedNetworkImage(
            imageUrl: img,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return const ImageShimmerAtom(
                isCircle: false,
                size: 16,
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                height: 176,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  FlutterRemix.image_line,
                  color: Colors.black,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
