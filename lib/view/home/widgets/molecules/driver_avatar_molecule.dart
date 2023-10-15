import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../atoms/common_image_atom.dart';

class DriverAvatarMolecule extends StatelessWidget {
  final String? imageUrl;
  final num? rating;

  const DriverAvatarMolecule({Key? key, required this.imageUrl, this.rating})
      : assert(rating == null || rating <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.w,
      child: Stack(
        children: [
          Container(
            height: 50.w,
            width: 50.w,
            decoration: const BoxDecoration(
                color: AppColors.white, shape: BoxShape.circle),
            padding: REdgeInsets.all(2),
            child: ClipOval(child: CommonImageAtom(imageUrl: imageUrl)),
          ),
          Positioned(
            top: 40.w,
            left: 2.w,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.white, width: 2.w),
              ),
              padding: REdgeInsets.symmetric(vertical: 4, horizontal: 6),
              child: Row(
                children: [
                  Icon(
                    FlutterRemix.star_smile_fill,
                    color: AppColors.white,
                    size: 12.sp,
                  ),
                  Text(
                    double.parse((rating ?? 0.0).toString()).toStringAsFixed(1),
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: AppColors.white,
                      letterSpacing: -0.26,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
