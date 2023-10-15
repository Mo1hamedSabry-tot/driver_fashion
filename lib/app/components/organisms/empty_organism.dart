import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';

import 'package:lottie/lottie.dart';
import 'package:test_project/app/core/utils/value_managers/app_strings.dart';

import '../../core/utils/value_managers/assets_manager.dart';

class EmptyOrganism extends StatelessWidget {
  const EmptyOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          16.verticalSpace,
          Lottie.asset(LottieManager.emptyBox),
          Text(
            AppStrings.nothingFound,
            style: AppFontStyles.interSemi(size: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              AppStrings.trySearchingAgain,
              style: AppFontStyles.interRegular(size: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
