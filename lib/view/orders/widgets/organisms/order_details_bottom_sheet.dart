import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import '../../../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/size_manager.dart';
import '../../../../domain/entites/order_details_entity.dart';
import 'foods_bottom_sheet.dart';
import 'order_details_item.dart';

class OrderDetailsBottomSheet extends StatelessWidget {
  final OrderDetailsEntity orderDetailsModel;
  final bool isntHistory;
  final bool isActiveButton;
  final VoidCallback changeOrderStatusCallback;
  final String nextOrderStatus;

  const OrderDetailsBottomSheet({
    super.key,
    required this.changeOrderStatusCallback,
    required this.orderDetailsModel,
    required this.isntHistory,
    required this.isActiveButton,
    required this.nextOrderStatus,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      height: SizeManager.orderDetailsBottomSheetHeight,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shrinkWrap: true,
        children: [
          OrderDetailsItem(
            orderDetailsModel: orderDetailsModel,
            // isSetCurrentOrder: isntHistory && isActiveButton,
          ),
          isntHistory
              ? Column(
                  children: [
                    16.verticalSpace,
                    CustomButton(
                      title: AppStrings.orderInformation,
                      onPressed: () {
                        showCustomModalBottomSheet(
                            context: context,
                            widget: FoodsBottomSheet(
                              orderModel: orderDetailsModel,
                            ),
                            isDarkMode: false);
                      },
                      textColor: AppColors.blackColor,
                      background: AppColors.transparent,
                      borderColor: AppColors.blackColor,
                    ),
                    16.verticalSpace,
                    CustomButton(
                      isLoading: false,
                      title: nextOrderStatus,
                      onPressed: changeOrderStatusCallback,
                      background: AppColors.primaryColor,
                    ),
                    16.verticalSpace,
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
