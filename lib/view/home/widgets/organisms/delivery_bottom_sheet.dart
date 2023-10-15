import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/molecules/bottom_sheet/base_presistent_bottom_sheet.dart';
import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/size_manager.dart';
import '../../../../domain/entites/order_details_entity.dart';
import '../../../orders/widgets/organisms/order_details_item.dart';

class DeliveryBottomSheet extends StatelessWidget {
  final OrderDetailsEntity orderDetailsModel;
  final bool isHomeBottomSheet;
  final VoidCallback deliverCallback;
  final bool isLoading;
  final VoidCallback? mapIconCallback;

  const DeliveryBottomSheet({
    super.key,
    required this.orderDetailsModel,
    this.isHomeBottomSheet = false,
    required this.deliverCallback,
    required this.isLoading,
    this.mapIconCallback,
  });

  @override
  Widget build(BuildContext context) {
    return BasePresistentBottomSheet(
      height: SizeManager.deliveryBottomSheetHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          children: [
            OrderDetailsItem(
              isHomeBottomSheet: isHomeBottomSheet,
              orderDetailsModel: orderDetailsModel,
              // isSetCurrentOrder: false, isntHistory && isActiveButton,
              mapIconCallback: mapIconCallback,
            ),
            20.verticalSpace,
            CustomButton(
              isLoading: isLoading,
              title: AppStrings.completeDelivery,
              textColor: AppColors.white,
              onPressed: deliverCallback,
            )
          ],
        ),
      ),
    );
  }
}
