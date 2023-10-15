import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../domain/entites/order_details_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity? product;
  final num? amount;
  final String price;

  const ProductItem(
      {Key? key,
      required this.product,
      required this.amount,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product?.title ?? "",
                  style: AppFontStyles.interSemi(
                      size: 14, color: AppColors.blackColor),
                ),
                4.verticalSpace,
                Text(
                  "Amount — ${(amount ?? 1) * (product?.quantity ?? 1)} ${(product?.unitTitle ?? "")}",
                  style: AppFontStyles.interRegular(
                      size: 14, color: AppColors.blackColor),
                ),
              ],
            ),
            Text(
              price,
              style: AppFontStyles.interSemi(
                  size: 14, color: AppColors.blackColor),
            ),
          ],
        ),
        product?.description != null
            ? Column(
                children: [
                  16.verticalSpace,
                  SizedBox(
                    width: 200,
                    child: RichText(
                      text: TextSpan(
                          text: AppStrings.description,
                          style: AppFontStyles.interSemi(
                              size: 14, color: AppColors.blackColor),
                          children: [
                            TextSpan(
                              text: product?.description ?? "",
                              style: AppFontStyles.interRegular(
                                  size: 14, color: AppColors.blackColor),
                            ),
                          ]),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
