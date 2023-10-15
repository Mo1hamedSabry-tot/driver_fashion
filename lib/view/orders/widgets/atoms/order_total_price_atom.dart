import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_project/view/orders/widgets/atoms/cost_atom.dart';

import '../../../../app/core/utils/value_managers/assets_manager.dart';

class OrderTotalPriceAtom extends StatelessWidget {
  final num totalPrice;

  const OrderTotalPriceAtom({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return CostAtom(
        cost: totalPrice,
        icon: SvgPicture.asset(ImgManager.svgCutter, width: 18));
  }
}
// SvgPicture.asset(ImgManger.svgCutter, width: 18),
//                   10.getSizedBox(isHorizontal: true),
//                   Text(
//                     AppHelpers.numberFormat(number: order.totalPrice),
//                     style: AppFontStyles.interSemi(size: 14),
//                   ),