import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import 'package:test_project/app/core/utils/value_managers/size_manager.dart';

import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../molecules/app_bar_bottom_sheet.dart';

class OTPBottomSheet extends StatelessWidget {
  const OTPBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        height: SizeManager.sendOTPBottomSheetHeight,
        child: Container(
          color: AppColors.greyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomSheetAppBar(
                title: AppStrings.enterOTP,
                onTap: () {},
              ),
              Text(
                AppStrings.otpInfo,
                style: AppFontStyles.interRegular(
                    size: 14.sp, color: AppColors.blackColor),
              ),
              Text(
                "email",
                style: AppFontStyles.interRegular(
                    size: 14.sp, color: AppColors.blackColor),
              ),
              40.verticalSpace,
              SizedBox(
                height: 65.h,
                child: PinFieldAutoFill(
                  codeLength: 4,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  cursor: Cursor(
                    width: 1,
                    height: 24,
                    color: AppColors.blackColor,
                    // isDarkMode ? AppColors.white : AppColors.blackColor,
                    enabled: true,
                  ),
                  // currentCode: "1234",
                  decoration: BoxLooseDecoration(
                    gapSpace: 10.w,
                    textStyle: AppFontStyles.interNormal(size: 15.sp),
                    //  GoogleFonts.inter(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 15.sp,
                    //     color: AppColors.blackColor
                    //     // isDarkMode ? AppColors.white : AppColors.blackColor,
                    //     ),

                    bgColorBuilder: FixedColorBuilder(AppColors.transparent
                        // isDarkMode
                        //     ? AppColors.transparent
                        //     : AppColors.transparent,
                        ),
                    strokeWidth: 1,

                    strokeColorBuilder:
                        const FixedColorBuilder(AppColors.blackColor),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton(
                      title: AppStrings.resend, //Resend
                      textStyle: AppFontStyles.interSemi(
                        // size: 5,
                        size: 16.sp,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        // if (state.isTimeExpired) {
                        //   notifier.startTimer();
                        //   //TODO resend
                        // }
                      },
                      // width: (MediaQuery.of(context).size.width - 40) / 3,
                      background: AppColors.blackColor,
                      // textColor: AppColors.white,
                    ),
                  ),
                  8.horizontalSpace,
                  Expanded(
                    flex: 2,
                    child: CustomButton(
                        title: AppStrings.confirm,
                        onPressed: () {
                          // //TODO confirm
                          // context.replaceRoute(const HomeRoute());
                        },
                        // width: 2 * (MediaQuery.of(context).size.width - 40) / 3,
                        background: AppColors.white,
                        // state.isConfirm ? AppColors.primaryColor : AppColors.white,
                        textColor: AppColors.textColor
                        // state.isConfirm ? AppColors.blackColor : AppColors.textColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
