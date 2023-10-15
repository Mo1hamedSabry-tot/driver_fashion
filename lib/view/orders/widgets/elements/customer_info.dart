import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/components/molecules/image_title_subtitle_molecule.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';
import 'package:test_project/domain/entites/order_details_entity.dart';
import 'package:test_project/view/orders/widgets/elements/map_icon.dart';
import 'package:test_project/view/orders/widgets/molecules/order_party_image_molecule.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({
    super.key,
    required this.orderDetailsModel,
    required this.isDeliveryClient,
    required this.isHomeBottomSheet,
  });

  final OrderDetailsEntity orderDetailsModel;
  final bool isDeliveryClient;
  final bool isHomeBottomSheet;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ITSInsides(
            img: OrderPartyImageMolecule(img: orderDetailsModel.customer.img),
            title: orderDetailsModel.address.address,
            subTitle: orderDetailsModel.customer.firstName),
        const VerticalDivider(
          color: AppColors.greyColor,
        ),
        Text(
          orderDetailsModel.customer.phone,
          style: AppFontStyles.interNormal(size: 12.sp, letterSpacing: -0.3),
        ),
        8.horizontalSpace,
        MapIcon(
            title: orderDetailsModel.customer.firstName,
            latLng: orderDetailsModel.location.latLng),
      ],
    );
  }
}
 // const Spacer(),
        // TODO: fix this
        // isDeliveryClient
        //     ? Row(
        //         children: [
        //           GestureDetector(
        //             onTap: () async {
        //               final Uri launchUri = Uri(
        //                 scheme: 'tel',
        //                 path: orderDetailsModel.customer.phone,
        //               );
        //               await launchUrl(launchUri);
        //             },
        //             child: Container(
        //               height: 38,
        //               width: 38,
        //               decoration: const BoxDecoration(
        //                   color: AppColors.blackColor, shape: BoxShape.circle),
        //               margin: const EdgeInsets.all(4),
        //               child: const Icon(
        //                 FlutterRemix.phone_fill,
        //                 color: AppColors.white,
        //                 size: 20,
        //               ),
        //             ),
        //           ),
        //           GestureDetector(
        //             onTap: () async {
        //               final Uri launchUri = Uri(
        //                 scheme: 'sms',
        //                 path: orderDetailsModel.customer.phone,
        //               );
        //               await launchUrl(launchUri);
        //             },
        //             child: Container(
        //               height: 38,
        //               width: 38,
        //               decoration: const BoxDecoration(
        //                   color: AppColors.blackColor, shape: BoxShape.circle),
        //               margin: const EdgeInsets.all(4),
        //               child: const Icon(
        //                 FlutterRemix.chat_1_fill,
        //                 color: AppColors.white,
        //                 size: 20,
        //               ),
        //             ),
        //           ),
        //         ],
        //       )
        //     : const SizedBox.shrink(),
        //TODO: fix the GetMyLocationAtom problem
        // const Spacer(),
        // isHomeBottomSheet ? const GetMyLocationAtom() : const SizedBox.shrink(),
        // GetMyLocationAtom()
      