import 'package:flutter/material.dart';

import '../../core/utils/theming/app_colors.dart';
import '../../core/utils/theming/app_fonts.dart';
import '../../../domain/entites/order_details_entity.dart';

class AddressDetailsElement extends StatelessWidget {
  const AddressDetailsElement({
    super.key,
    required this.orderDetailsModel,
  });

  final OrderDetailsEntity orderDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Restaurant--Home",
                style: AppFontStyles.interNormal(
                    size: 12, color: AppColors.blackColor, letterSpacing: -0.3),
              ),
              Text(
                "${orderDetailsModel.distance} km",
                style: AppFontStyles.interSemi(
                    size: 14, color: AppColors.blackColor, letterSpacing: -0.3),
              ),
            ],
          ),
          orderDetailsModel.address.house != "null"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home",
                      style: AppFontStyles.interNormal(
                          size: 12,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      orderDetailsModel.address.house ?? "",
                      style: AppFontStyles.interSemi(
                          size: 14,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          orderDetailsModel.address.office != "null"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "entr",
                      // AppHelpers.getTranslation(TrKeys.entr),
                      style: AppFontStyles.interNormal(
                          size: 12,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      orderDetailsModel.address.office ?? "",
                      style: AppFontStyles.interSemi(
                          size: 14,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          orderDetailsModel.address.floor != "null"
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "apart",
                      // AppHelpers.getTranslation(TrKeys.apart),
                      style: AppFontStyles.interNormal(
                          size: 12,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                    Text(
                      orderDetailsModel.address.floor ?? "",
                      style: AppFontStyles.interSemi(
                          size: 14,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
