import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/core/utils/helpers/helpers.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';

class CostAtom extends StatelessWidget {
  const CostAtom({
    super.key,
    required this.cost,
    required this.icon,
  });

  final num cost;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        10.horizontalSpace,
        Text(
          AppHelpers.numberFormat(number: cost),
          style: AppFontStyles.interSemi(size: 14),
        ),
      ],
    );
  }
}
