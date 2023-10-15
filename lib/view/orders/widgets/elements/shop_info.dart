import 'package:flutter/material.dart';

import '../../../../app/components/molecules/image_title_subtitle_molecule.dart';
import '../../../../domain/entites/order_details_entity.dart';
import '../molecules/order_party_image_molecule.dart';
import 'shop_extra_details.dart';

class ShopInfo extends StatelessWidget {
  const ShopInfo(
      {super.key, required this.orderDetailsModel, this.mapIconCallback
      // required this.isDeliveryShop,
      // required this.isSetCurrentOrder,
      });

  final OrderDetailsEntity orderDetailsModel;
  final VoidCallback? mapIconCallback;
  // final bool isDeliveryShop;
  // final bool isSetCurrentOrder;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ITSInsides(
          img: OrderPartyImageMolecule(
            img: orderDetailsModel.shop.logoImg,
          ),
          title: orderDetailsModel.shop.title,
          subTitle: "№ ${orderDetailsModel.id}",
        ),
        const VerticalDivider(),
        ShopExtraDetails(
          orderDetailsModel: orderDetailsModel,
          mapIconCallback: mapIconCallback,
        ),
        const Spacer(),
        // isSetCurrentOrder
        //     ? CustomToggleElement(isOnline: true, onChange: (change) {})
        //     : const SizedBox.shrink(),
      ],
    );
  }
}
