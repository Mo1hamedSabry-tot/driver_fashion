import 'package:flutter/material.dart';
import 'package:test_project/app/components/elements/list_appbar.dart';
import 'package:test_project/app/components/atoms/deliveries_title_text.dart';

class DeliveriesHistoryAppBar extends StatelessWidget {
  final String title;

  const DeliveriesHistoryAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListAppBar(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Container(
        //   height: 10,
        //   color: Colors.red,
        // ),
        DeliveriesTitleText(
          title: title,
        ),
      ],
    ));
  }
}
