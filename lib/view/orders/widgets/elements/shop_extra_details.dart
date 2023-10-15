import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:test_project/app/core/utils/theming/app_fonts.dart';
import 'package:test_project/domain/entites/order_details_entity.dart';
import 'package:test_project/view/orders/widgets/elements/map_icon.dart';

class ShopExtraDetails extends StatelessWidget {
  const ShopExtraDetails({
    super.key,
    required this.orderDetailsModel,
    this.mapIconCallback,
  });

  final OrderDetailsEntity orderDetailsModel;
  final VoidCallback? mapIconCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          intl.DateFormat("hh:mm").format(DateTime.tryParse(
                      orderDetailsModel.updatedAt ?? DateTime.now().toString())
                  ?.toLocal() ??
              DateTime.now()),
          style: AppFontStyles.interNormal(size: 14, letterSpacing: -0.3),
        ),
        16.horizontalSpace,
        Icon(
          FlutterRemix.building_fill,
          size: 18.sp,
        ),
        8.horizontalSpace,
        MapIcon(
          title: orderDetailsModel.shop.title,
          latLng: orderDetailsModel.shop.location.latLng,
          onTap: mapIconCallback,
        ),
      ],
    );
  }
}
