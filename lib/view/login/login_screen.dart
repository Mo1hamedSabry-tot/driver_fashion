import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../app/components/molecules/custom_button.dart';
import '../../app/core/utils/helpers/hex_color.dart';
import '../../app/core/utils/theming/app_colors.dart';
import '../../app/core/utils/value_managers/app_constants.dart';
import '../../app/core/utils/value_managers/app_strings.dart';
import '../../app/core/utils/value_managers/assets_manager.dart';
import 'widgets/organisms/login_bottom_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox.expand(
            child: Hero(
              tag: AppConstants.splashImgHeroTag,
              child: Image.asset(
                ImgManager.pharmacyDelivery,
                // co: HexColor("#32BBCB"),
                // fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
            child: CustomButton(
                title: AppStrings.login,
                textColor: AppColors.white,
                onPressed: () {
                  showCustomModalBottomSheet(
                    context: context,
                    widget: LoginBottomSheet(),
                    isDarkMode: false,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
