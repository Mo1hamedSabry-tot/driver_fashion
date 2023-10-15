import 'package:charts_flutter_new/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/components/elements/title_icon.dart';
import '../../../app/core/utils/theming/app_colors.dart';

class ChartsOrganism extends StatelessWidget {
  const ChartsOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndIcon(title: "Earnings Chart"),
        16.verticalSpace,
        Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            padding: EdgeInsets.all(16.r),
            child: BarChart(
              [
                Series(
                    id: "1",
                    data: [
                      5,
                      2,
                    ],
                    domainFn: (a, b) {
                      // return "second";
                      return b.toString();
                    },
                    measureFn: (c, d) {
                      return d;
                    }),
              ],
              animate: true,
              vertical: false,
              animationDuration: const Duration(seconds: 1),
              defaultRenderer: BarRendererConfig(
                  cornerStrategy: const ConstCornerStrategy(6)),
            )),
        32.verticalSpace,
      ],
    );
  }
}
