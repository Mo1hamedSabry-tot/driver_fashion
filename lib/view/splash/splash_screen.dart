import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/core/utils/value_managers/app_constants.dart';
import '../../app/core/utils/value_managers/assets_manager.dart';
import '../orders/widgets/molecules/order_party_image_molecule.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<SplashBloc>().add(NavigateToNextScreenEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: AppConstants.splashImgHeroTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              ImgManager.totLogo,
              width: 170.w,
              height: 170.w,
            ),
            //  OrderPartyImageMolecule(
            //   img: ImgManager.totLogo, //ImgManager.networkLogin,
            //   isCircle: false,
            //   shimmerSize: 150,
            //   imgHeight: 150,
            //   imgWidth: 150,
            // ),
          ),
        ),
      ),
    );
  }
}
