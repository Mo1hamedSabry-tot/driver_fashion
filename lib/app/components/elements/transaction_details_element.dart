import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_project/app/core/utils/value_managers/assets_manager.dart';

import '../../core/utils/helpers/helpers.dart';
import '../../core/utils/theming/app_colors.dart';
import '../../core/utils/theming/app_fonts.dart';
import '../../../domain/entites/order_details_entity.dart';

class TransactionDetailsElement extends StatelessWidget {
  const TransactionDetailsElement({
    super.key,
    required this.orderDetailsModel,
  });

  final OrderDetailsEntity orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SvgPicture.asset(ImgManager.svgCutter,
              width: 18), //"assets/svg/cutter.svg"
          10.horizontalSpace,
          Text(
            AppHelpers.numberFormat(number: orderDetailsModel.totalPrice),
            style: AppFontStyles.interSemi(size: 12),
          ),
          const Spacer(),
          const Icon(
            FlutterRemix.takeaway_fill,
            size: 18,
          ),
          10.horizontalSpace,
          Text(
            AppHelpers.numberFormat(number: orderDetailsModel.deliveryFee),
            style: AppFontStyles.interSemi(size: 12),
          ),
          const Spacer(),
          const Icon(
            FlutterRemix.bank_card_2_line,
            size: 18,
          ),
          10.horizontalSpace,
          Text(
            orderDetailsModel.transaction.tag,
            style: AppFontStyles.interSemi(size: 12),
          ),
        ],
      ),
    );
  }
}
