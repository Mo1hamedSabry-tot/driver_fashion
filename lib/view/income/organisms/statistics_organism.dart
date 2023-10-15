import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/domain/entites/income_entity.dart';

import '../../../app/components/elements/title_icon.dart';
import '../../../app/core/utils/theming/app_colors.dart';
import '../../../app/core/utils/theming/app_fonts.dart';
import '../../../app/core/utils/value_managers/app_strings.dart';
import '../items/statistics_item.dart';

class StatisticsOrganism extends StatelessWidget {
  // final int totalOrderCount;
  // final int todaysCount;
  // final int acceptedOrdersCount;
  // final int rejectedOrdersCount;
  // final int doneOrdersCount;
  // final int canceledOrdersCount;

  // final int acceptedOrdersPrc;
  // final int rejectedOrdersPrc;
  // final int doneOrdersPrc;
  // final int canceledOrdersPrc;

  final StatisticsEntity statisticsModel;

  const StatisticsOrganism({
    Key? key,
    // required this.totalOrderCount,
    // required this.todaysCount,
    // required this.acceptedOrdersCount,
    // required this.rejectedOrdersCount,
    // required this.doneOrdersCount,
    // required this.canceledOrdersCount,
    // required this.acceptedOrdersPrc,
    // required this.rejectedOrdersPrc,
    // required this.doneOrdersPrc,
    // required this.canceledOrdersPrc,
    required this.statisticsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleAndIcon(title: AppStrings.statistics),
        16.verticalSpace,
        SizedBox(
          height: 190.h,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.white,
                ),
                padding: EdgeInsets.all(12.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.totalOrders,
                      style: AppFontStyles.interNormal(
                          size: 12.sp,
                          color: AppColors.blackColor,
                          letterSpacing: -0.3),
                    ),
                    const Spacer(),
                    Text(
                      // AppStrings.totalOrders,
                      statisticsModel.totalOrders.totalOrdersCount.toString(),
                      style: AppFontStyles.interSemi(
                          size: 34.sp,
                          color: AppColors.blackColor,
                          letterSpacing: -1),
                    ),
                    RichText(
                      text: TextSpan(
                          text: AppStrings.today,
                          style: AppFontStyles.interNormal(
                              size: 12.sp,
                              color: AppColors.blackColor,
                              letterSpacing: -0.3),
                          children: [
                            const TextSpan(text: " "),
                            TextSpan(
                              // text: AppStrings.today,
                              text: statisticsModel
                                  .totalOrders.todaysOrdersCount
                                  .toString(),
                              style: AppFontStyles.interSemi(
                                  size: 12.sp,
                                  color: AppColors.blackColor,
                                  letterSpacing: -0.3),
                            )
                          ]),
                    )
                  ],
                ),
              ),
              8.horizontalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      StatisticsItem(
                        title: AppStrings.acceptedOrders,
                        count: statisticsModel
                            .acceptedOrders.count, //acceptedOrdersCount,
                        percentage: statisticsModel.acceptedOrders.prc,
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.white,
                      ),
                      8.horizontalSpace,
                      StatisticsItem(
                        title: AppStrings.rejectedOrders,
                        count: statisticsModel.rejectedOrders.count,
                        percentage: statisticsModel.rejectedOrders.prc,
                        backgroundColor: AppColors.redColor,
                        textColor: AppColors.white,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatisticsItem(
                        title: AppStrings.completedOrders,
                        count: statisticsModel.completedOrders.count,
                        percentage: statisticsModel.completedOrders.prc,
                      ),
                      8.horizontalSpace,
                      StatisticsItem(
                        title: AppStrings.newOrders,
                        count: statisticsModel.newOrders.count,
                        percentage: statisticsModel.newOrders.prc,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
