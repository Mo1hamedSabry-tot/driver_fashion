import 'package:flutter/material.dart';

import '../../core/utils/theming/app_colors.dart';
import '../molecules/appbar/deliveries_history_app_bar.dart';
import '../molecules/history_template_floating_action_button.dart';

class DeliveriesHistoryTemplate extends StatefulWidget {
  final String title;
  final Widget child;

  const DeliveriesHistoryTemplate({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  State<DeliveriesHistoryTemplate> createState() =>
      _DeliveriesHistoryTemplateState();
}

class _DeliveriesHistoryTemplateState extends State<DeliveriesHistoryTemplate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyColor,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: const HistoryTemplateFloatingActionButton(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: DeliveriesHistoryAppBar(
          title: widget.title,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: widget.child,
      ),
    );
  }
}
