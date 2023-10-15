import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import 'package:test_project/app/components/molecules/custom_button.dart';
import 'package:test_project/view/login/widgets/atoms/email_text_field.dart';
import 'package:test_project/view/login/widgets/organisms/otp_bottom_sheet.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/size_manager.dart';
import '../molecules/app_bar_bottom_sheet.dart';

class ResetPasswordBottomSheet extends StatelessWidget {
  ResetPasswordBottomSheet({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: SizeManager.resetPasswordBottomSheetHeight,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BottomSheetAppBar(
                  title: AppStrings.resetPassword,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  AppStrings.resetInfoText,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                40.verticalSpace,
                EmailTextField(
                  controller: emailController,
                ),
              ],
            ),
            CustomButton(
              title: AppStrings.send,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  // print("hello!");
                  showCustomModalBottomSheet(
                      context: context,
                      widget: const OTPBottomSheet(),
                      isDarkMode: false);
                }
              },
              background: AppColors.primaryColor,
              textColor: AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
