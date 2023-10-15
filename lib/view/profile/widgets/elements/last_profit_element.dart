import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../app/core/utils/helpers/helpers.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';

class LastProfitELement extends StatelessWidget {
  final double lastProfit;

  const LastProfitELement({
    super.key,
    required this.lastProfit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.lastProfit,
          style: AppFontStyles.interNormal(size: 12.sp, letterSpacing: -0.3),
        ),
        Text(
          AppHelpers.numberFormat(number: lastProfit).length < 10
              ? AppHelpers.numberFormat(number: lastProfit)
              : "\$${intl.NumberFormat.compact().format((lastProfit))}",
          style: AppFontStyles.interSemi(
              size: 14.sp, letterSpacing: -0.3, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
