import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/domain/entites/income_entity.dart';
import 'package:test_project/view/income/molecules/income_app_bar_molecule.dart';
import 'package:test_project/view/income/molecules/last_order_molecule.dart';
import 'package:test_project/view/income/organisms/chart_organism.dart';

import '../../app/components/molecules/custom_tab_bar.dart';
import '../../app/core/utils/theming/app_colors.dart';
import '../../app/core/utils/value_managers/app_strings.dart';
import 'molecules/transactions_molecule.dart';
import 'organisms/statistics_organism.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({super.key});

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late IncomeEntity incomeModel;
  bool isLoading = true;

  final _tabs = const [
    Tab(
      child: Text(
        AppStrings.today,
      ),
    ),
    Tab(
      child: Text(
        AppStrings.weekly,
      ),
    ),
    Tab(
      child: Text(
        AppStrings.monthly,
      ),
    ),
  ];
  final Map<String, dynamic> incomeJson = {
    "lastOrder": {
      "price": 1999.0,
      "income": 83.0,
    },
    "delivermanTransctions": {
      "wallet": 2222222222222222222.0,
      "rating": 4.3,
    },
    "statistics": {
      "totalOrders": {
        "totalOrders": 20,
        "todaysOrders": 2,
      },
      "acceptedOrders": {
        "count": 12,
        "prc": 60.0,
      },
      "rejectedOrders": {
        "count": 2,
        "prc": 10.0,
      },
      "completedOrders": {
        "count": 4,
        "prc": 20.0,
      },
      "newOrders": {
        "count": 2,
        "prc": 10.0,
      }
    }
  };

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      // if (_tabController.index == 0) {
      //   ref.read(statisticsProvider.notifier).fetchStatistics(
      //       startTime: DateTime.now(), endTime: DateTime.now());
      // } else if (_tabController.index == 1) {
      //   ref.read(statisticsProvider.notifier).fetchStatistics(
      //       startTime: DateTime.now(),
      //       endTime: DateTime.now().subtract(const Duration(days: 7)));
      // } else {
      //   ref.read(statisticsProvider.notifier).fetchStatistics(
      //       startTime: DateTime.now(),
      //       endTime: DateTime.now().subtract(const Duration(days: 30)));
      // }
    });
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) {
    //     ref.read(statisticsProvider.notifier).fetchStatistics(
    //         startTime: DateTime.now(), endTime: DateTime.now());
    //   },
    // );

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        incomeModel = IncomeEntity.fromJson(json: incomeJson);

        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Builder(builder: (context) {
            return Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: const IncomeAppBar(),
              ),
              backgroundColor: AppColors.greyColor,
              body: SingleChildScrollView(
                padding: EdgeInsets.only(
                  right: 16.w,
                  left: 16.w,
                  bottom: MediaQuery.of(context).padding.bottom + 56.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //? tabbar
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: CustomTabBar(
                        tabController: _tabController,
                        tabs: _tabs,
                      ),
                    ),
                    //? last order
                    LastOrderMolecule(
                      lastOrderIncome: incomeModel.lastOrderModel.lastIncome,
                      lastOrderPrice: incomeModel.lastOrderModel.lastOrderPrice,
                    ),
                    24.verticalSpace,
                    TransactionsMolecule(
                      rating: incomeModel.delivermanTransctionsModel.rating,
                      balance: incomeModel.delivermanTransctionsModel.wallet
                          .toString(),
                    ),
                    24.verticalSpace,
                    StatisticsOrganism(
                      statisticsModel: incomeModel.statisticsModel,
                    ),
                    24.verticalSpace,
                    const ChartsOrganism(),
                  ],
                ),
              ),
            );
          });
  }
}
