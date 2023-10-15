import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';
import 'package:test_project/domain/entites/order_details_entity.dart';

import '../../../../app/components/elements/title_icon.dart';
import '../../../../app/core/utils/helpers/helpers.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../molecules/product_item.dart';

class FoodsBottomSheet extends StatelessWidget {
  final OrderDetailsEntity orderModel;

  const FoodsBottomSheet({Key? key, required this.orderModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TitleAndIcon(title: AppStrings.products),
            16.verticalSpace,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderModel.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 6.h),
                          child: ProductItem(
                              product: orderModel.products[index],
                              // orderModel.details?[index].quantity
                              amount:
                                  orderModel.products[index].quantity, //TODO
                              price: AppHelpers.numberFormat(
                                  number: orderModel.products[index].totalPrice)
                              // hasData
                              //     ? AppHelpers.numberFormat(
                              //         number:
                              //             orderModel.details?[index].totalPrice ??
                              //                 0)
                              //     : AppHelpers.numberFormat(
                              //         number:
                              //             state.order?.details?[index].totalPrice ??
                              //                 0),
                              ),
                        );
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: AppFontStyles.interSemi(
                            size: 16, letterSpacing: -0.3),
                      ),
                      Text(
                        AppHelpers.numberFormat(number: orderModel.totalPrice),
                        // hasData
                        //     ? AppHelpers.numberFormat(
                        //         number: orderModel.totalPrice ?? 0)
                        //     : AppHelpers.numberFormat(
                        //         number: state.order?.totalPrice ?? 0),
                        // style: AppFontStyles.interSemi(
                        //     size: 16, letterSpacing: -0.3),
                      )
                    ],
                  )
                ],
              ),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
