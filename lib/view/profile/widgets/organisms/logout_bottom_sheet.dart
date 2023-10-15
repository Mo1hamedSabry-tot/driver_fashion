import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/size_manager.dart';

class LogoutBottomSheet extends StatelessWidget {
  final VoidCallback? logoutAction;
  final bool? isLoading;

  const LogoutBottomSheet({
    super.key,
    this.logoutAction,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: SizeManager.logoutBottomSheetHeight,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            40.verticalSpace,
            Text(
              AppStrings.wantToLogout,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.02,
              ),
            ),
            36.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isLoading: isLoading ?? false,
                    textColor: AppColors.blackColor,
                    title: AppStrings.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    background: AppColors.transparent,
                    borderColor: AppColors.blackColor,
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    title: AppStrings.yes,
                    onPressed: logoutAction,
                    background: AppColors.primaryColor,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
