import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/components/elements/pop_button.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/domain/entites/parcel_entity.dart';
import 'package:test_project/app/components/molecules/appbar/deliveries_app_bar.dart';

import '../molecules/custom_tab_bar.dart';

class DeliveriesTemplate extends StatefulWidget {
  final String title;
  final String activeTitle;
  final String availableTitle;
  final Widget activeWidget;
  final Widget availableWidget;
  final int count;

  const DeliveriesTemplate({
    super.key,
    required this.title,
    required this.activeTitle,
    required this.availableTitle,
    required this.activeWidget,
    required this.availableWidget,
    required this.count,
  });

  @override
  State<DeliveriesTemplate> createState() => _DeliveriesTemplateState();
}

class _DeliveriesTemplateState extends State<DeliveriesTemplate>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  List<ParcelEntity> activeOrders = [];
  List<ParcelEntity> availableOrders = [];
  late final List<Tab> _tabs;

  @override
  void initState() {
    super.initState();

    _tabs = [
      Tab(
        child: Text(
          widget.activeTitle,
        ),
      ),
      Tab(
        child: Text(
          widget.availableTitle,
        ),
      ),
    ];
    _tabController = TabController(length: 2, vsync: this);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: const PopButton(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: DeliveriesAppBar(title: widget.title, count: widget.count),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          // vertical: 16,
        ),
        child: Column(
          children: [
            16.verticalSpace,
            CustomTabBar(
              tabController: _tabController,
              tabs: _tabs,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  widget.activeWidget,
                  widget.availableWidget,
                ],
              ),
            ),
            // 50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
