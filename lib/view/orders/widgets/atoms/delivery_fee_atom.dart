import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/view/orders/widgets/atoms/cost_atom.dart';

class DeliveryFeeAtom extends StatelessWidget {
  const DeliveryFeeAtom({
    super.key,
    required this.deliveryFee,
  });

  final num deliveryFee;

  @override
  Widget build(BuildContext context) {
    return CostAtom(
      cost: deliveryFee,
      icon: Icon(
        FlutterRemix.takeaway_fill,
        size: 18.sp,
      ),
    );
  }
}
