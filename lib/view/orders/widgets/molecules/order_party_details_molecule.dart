import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/core/utils/theming/app_fonts.dart';

class OrderPartyDetailsMolecule extends StatelessWidget {
  const OrderPartyDetailsMolecule({
    super.key,
    this.extraDetail,
    required this.subTitle,
    required this.title,
  });

  final String title;
  final String subTitle;
  final String? extraDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFontStyles.interSemi(size: 14, letterSpacing: -0.3),
          maxLines: 2,
          overflow: TextOverflow.visible,
        ),
        2.verticalSpace,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                subTitle,
                style: AppFontStyles.interNormal(size: 14, letterSpacing: -0.3)
                    .copyWith(overflow: TextOverflow.ellipsis),
              ),
            ),
            const VerticalDivider(),
            Text(
              extraDetail ?? "",
              style: AppFontStyles.interNormal(size: 14, letterSpacing: -0.3),
            ),
          ],
        ),
      ],
    );
  }
}
