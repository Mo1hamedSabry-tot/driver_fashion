import 'package:flutter/material.dart';

abstract class AppConstants {
  static const shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
  );

  // static final OverlayEntry overlayEntry = OverlayEntry(
  //   builder: (context) {
  //     return const SafeArea(
  //       child: Scaffold(
  //         backgroundColor: AppColors.transparent,
  //         body: Center(
  //           child: CircularProgressIndicator.adaptive(),
  //         ),
  //       ),
  //     );
  //   },
  // );

  static const driverAvatarHeroTag = "driver avatar";
  static const splashImgHeroTag = "splash_img";

  static const customerServiceNumber = "1111";
  static const telephoneSchema = 'tel';
}
