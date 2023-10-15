import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/value_managers/size_manager.dart';

import '../../../../app/components/molecules/bottom_sheet/base_presistent_bottom_sheet.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../domain/stories/entities/story_entity.dart';
import '../../../stories/stories_screen.dart';
import '../molecules/balance_molecule.dart';
import '../molecules/benefit_molecule.dart';
import '../molecules/story_card_molecule.dart';

class DefaultBottomSheet extends StatelessWidget {
  final String balance;
  final List<StoryEntity> stories;

  const DefaultBottomSheet(
      {Key? key, required this.stories, required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePresistentBottomSheet(
      height: SizeManager.defaultBottomSheetHeight,
      child: Column(
        children: [
          Container(
            height: 4.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: AppColors.bottomSheetIconColor,
              borderRadius: BorderRadius.circular(40.r),
            ),
          ),
          Column(
            children: [
              18.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BalanceMolecule(
                    balance: balance,
                  ),
                  const BenefitMolecule(),
                ],
              ),
              SizedBox(
                height: 195.h,
                child: ListView.builder(
                  padding: REdgeInsets.only(top: 28),
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoresCardMolecule(
                      img: stories[index].imgLink,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoriesScreen(
                              stories: stories,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
