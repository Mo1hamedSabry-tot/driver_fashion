import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bottom_sheet/show_custom_bottom_sheet.dart';
import '../elements/pop_button.dart';
import '../elements/filter_icon_button.dart';
import '../templates/filter_bottom_sheet.dart';

class HistoryTemplateFloatingActionButton extends StatelessWidget {
  const HistoryTemplateFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const PopButton(),
          FilterIconButton(
            onTap: () {
              showCustomModalBottomSheet(
                context: context,
                widget: FilterBottomSheet(
                  height: 600.h,
                ),
                isDarkMode: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
