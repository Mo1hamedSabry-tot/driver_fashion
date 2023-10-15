import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app/components/elements/pop_button.dart';
import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_constants.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';

class CustomFloatingMolecule extends StatelessWidget {
  const CustomFloatingMolecule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PopButton(),
          10.horizontalSpace,
          Expanded(
            child: CustomButton(
              textColor: AppColors.white,
              title: AppStrings.onlineHelper,
              onPressed: () async {
                final Uri launchUri = Uri(
                  scheme: AppConstants.telephoneSchema,
                  path: AppConstants.customerServiceNumber,
                );
                await launchUrl(launchUri);
              },
              icon: Icon(
                FlutterRemix.chat_smile_2_fill,
                color: AppColors.white,
                size: 20.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
