import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/view/profile/widgets/elements/last_profit_element.dart';

import '../../../../app/components/molecules/image_title_subtitle_molecule.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/assets_manager.dart';

class AccountStats extends StatelessWidget {
  final String balance;
  final int deliveredOrders;
  final double lastProfit;

  const AccountStats({
    super.key,
    required this.balance,
    required this.deliveredOrders,
    required this.lastProfit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      child: Column(
        children: [
          ProfileElementPadding(
            child: Row(
              children: [
                ITSInsides(
                  img: SvgPicture.asset(ImgManager.svgBalance),
                  title: AppStrings.balance,
                  subTitle: balance, //"10e+219",
                ),
                const Spacer(),
                LastProfitELement(lastProfit: lastProfit),
                16.horizontalSpace,
              ],
            ),
          ),
          10.verticalSpace,
          ITSMolecule(
            img: const Icon(
              FlutterRemix.checkbox_circle_fill,
              size: 30,
            ),
            title: AppStrings.deliveredOrders,
            subTitle: deliveredOrders.toString(), //"125",
          ),
        ],
      ),
    );
  }
}
