import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:test_project/app/components/atoms/shimmer_loading.dart';

import '../../../../app/components/elements/double_dot_element.dart';
import '../../../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../domain/entites/order_details_entity.dart';
import '../atoms/credit_card_icon_atom.dart';
import '../molecules/cost_and_details_molecule.dart';
import '../molecules/order_party_molecule.dart';
import 'order_details_bottom_sheet.dart';

class OrderCard extends StatelessWidget {
  final OrderDetailsEntity orderModel;
  final bool isntHistory;
  final bool isActiveButton;
  final VoidCallback changeOrderStatusCallback;
  final String orderNextStatus;
  final bool isLoading;

  const OrderCard({
    Key? key,
    required this.changeOrderStatusCallback,
    required this.orderModel,
    required this.isntHistory,
    this.isActiveButton = false,
    this.orderNextStatus = AppStrings.pickupOrder,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
        child: ActualCard(
            orderNextStatus: orderNextStatus,
            orderModel: orderModel,
            isntHistory: isntHistory,
            isActiveButton: isActiveButton,
            changeOrderStatusCallback: changeOrderStatusCallback));
  }
}

class ActualCard extends StatelessWidget {
  const ActualCard({
    super.key,
    required this.orderNextStatus,
    required this.orderModel,
    required this.isntHistory,
    required this.isActiveButton,
    required this.changeOrderStatusCallback,
  });

  final String orderNextStatus;
  final OrderDetailsEntity orderModel;
  final bool isntHistory;
  final bool isActiveButton;
  final VoidCallback changeOrderStatusCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCustomModalBottomSheet(
            context: context,
            radius: 12.r,
            widget: OrderDetailsBottomSheet(
              nextOrderStatus: orderNextStatus,
              orderDetailsModel: orderModel,
              isntHistory: isntHistory,
              isActiveButton: isActiveButton,
              changeOrderStatusCallback: changeOrderStatusCallback,
            ),
            isDarkMode: false);
      },
      child: Container(
        width: double.infinity,
        margin: REdgeInsets.only(bottom: 10),
        padding: REdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      OrderPartyMolecule(
                        title: orderModel.shop.title,
                        subTitle: orderModel.id,
                        img: orderModel.shop.logoImg,
                        extraDetail: intl.DateFormat("MMM dd hh:mm").format(
                            DateTime.tryParse(orderModel
                                    // TODO:
                                    .createdAt) ??
                                DateTime
                                    .now()), //"createdAt", //orderModel.createdAt,
                      ),
                      const Spacer(),
                      const CreditCardIconAtom(),
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.only(left: 10),
                    child: const DoubleDotElement(),
                  ),
                  OrderPartyMolecule(
                    title: orderModel.address.address,
                    subTitle: orderModel.customer.firstName,
                    img: orderModel.customer.img,
                    extraDetail: orderModel.customer.phone,
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            CostAndDetailsMolecule(
              totalPrice: orderModel.totalPrice,
              deliveryFee: orderModel.deliveryFee,
            ),
          ],
        ),
      ),
    );
  }
}
