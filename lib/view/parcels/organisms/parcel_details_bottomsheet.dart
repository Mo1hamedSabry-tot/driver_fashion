import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/domain/entites/parcel_entity.dart';

import '../../../app/components/molecules/custom_button.dart';
import '../../../app/components/molecules/parcel_details_molecule.dart';
import '../../../app/core/utils/value_managers/app_strings.dart';

class ParcelDetailsBotttomSheet extends StatelessWidget {
  final ParcelEntity parcelModel;
  final bool isntHistory;
  // final bool isSet;

  const ParcelDetailsBotttomSheet({
    super.key,
    required this.parcelModel,
    required this.isntHistory,
    // required this.isSet,
  });

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shrinkWrap: true,
        children: [
          ParcelDetailsMolecule(parcelModel: parcelModel),
          isntHistory
              ? Column(
                  children: [
                    32.verticalSpace,
                    CustomButton(
                      background: AppColors.primaryColor,
                      isLoading: false,
                      // TODO ref.watch(homeProvider).isLoading,
                      title: AppStrings.order,
                      onPressed: () async {},
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
