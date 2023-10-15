import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entites/order_details_entity.dart';
import '../elements/transaction_details_element.dart';
import '../elements/address_details_element.dart';
import '../elements/user_note_element.dart';

class OrderInfoMolecule extends StatelessWidget {
  final OrderDetailsEntity orderDetailsModel;

  const OrderInfoMolecule({super.key, required this.orderDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddressDetailsElement(orderDetailsModel: orderDetailsModel),
        10.verticalSpace,
        UserNoteElement(note: orderDetailsModel.note),
        10.verticalSpace,
        TransactionDetailsElement(orderDetailsModel: orderDetailsModel),
      ],
    );
  }
}
