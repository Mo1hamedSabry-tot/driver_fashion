import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/core/utils/theming/app_fonts.dart';
import 'package:test_project/app/components/elements/list_appbar.dart';

import '../../../core/utils/value_managers/app_strings.dart';
import '../../atoms/deliveries_title_text.dart';

class DeliveriesAppBar extends StatelessWidget {
  final String title;
  final int count;
  final _style = AppFontStyles.interRegular(size: 12.sp, letterSpacing: -0.3);

  DeliveriesAppBar({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListAppBar(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DeliveriesTitleText(title: title),
          Row(
            children: [
              Text(
                AppStrings.thereAre,
                style: _style,
              ),
              Text(
                " $count ",
                style: _style,
              ),
              Text(
                title.toLowerCase(),
                style: _style,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
