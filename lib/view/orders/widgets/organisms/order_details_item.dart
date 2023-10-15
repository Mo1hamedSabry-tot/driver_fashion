import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:test_project/domain/entites/order_details_entity.dart';

import '../../../../app/components/molecules/order_info_molecule.dart';
import '../molecules/order_avatar_molecule.dart';

class OrderDetailsItem extends StatelessWidget {
  final OrderDetailsEntity orderDetailsModel;
  // final bool isDeliveryShop;
  final bool isDeliveryClient;
  // final bool isSetCurrentOrder;
  final bool isHomeBottomSheet;
  final VoidCallback? mapIconCallback;
  const OrderDetailsItem({
    Key? key,
    required this.orderDetailsModel,
    // this.isDeliveryShop = false,
    this.isDeliveryClient = false,
    // this.isSetCurrentOrder = false,
    this.isHomeBottomSheet = false,
    this.mapIconCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        OrderAvatarMolecule(
          isHomeBottomSheet: isHomeBottomSheet,
          orderDetailsModel: orderDetailsModel,
          // isDeliveryShop: isDeliveryShop,
          // isSetCurrentOrder: isSetCurrentOrder,
          isDeliveryClient: isDeliveryClient,
          mapIconCallback: mapIconCallback,
        ),
        16.verticalSpace,
        OrderInfoMolecule(orderDetailsModel: orderDetailsModel),
      ],
    );
  }
}
