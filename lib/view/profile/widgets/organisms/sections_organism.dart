import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../../../app/config/routes.dart';
import '../molecules/section_item.dart';
import 'language_bottom_sheet.dart';
import 'settings_bottom_sheet.dart';

class SectionsOrganism extends StatelessWidget {
  const SectionsOrganism({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SectionItem(
          title: "Profile Settings",
          icon: FlutterRemix.user_settings_line,
          onTap: () {
            showCustomModalBottomSheet(
                context: context,
                widget: const SettingsBottomSheet(),
                isDarkMode: false);
          },
        ),
        SectionItem(
          title: "Orders",
          icon: FlutterRemix.order_play_line,
          onTap: () {
            Navigator.pushNamed(context, Routes.ordersRoute);
          },
        ),
        SectionItem(
          title: "Parcels",
          icon: FlutterRemix.archive_line,
          onTap: () {
            Navigator.pushNamed(context, Routes.parcelsRoute);
          },
        ),
        SectionItem(
          title: "Orders History",
          icon: FlutterRemix.history_line,
          onTap: () {
            Navigator.pushNamed(context, Routes.ordersHistoryRoute);
          },
        ),
        SectionItem(
          title: "Parcels History",
          icon: FlutterRemix.folder_history_fill,
          onTap: () {
            Navigator.pushNamed(context, Routes.parcelsHistoryRoute);
          },
        ),
        SectionItem(
          title: "Income",
          icon: FlutterRemix.line_chart_line,
          onTap: () {
            Navigator.pushNamed(context, Routes.incomeRoute);
          },
        ),
        SectionItem(
          title: "Language",
          icon: FlutterRemix.global_line,
          onTap: () {
            showCustomModalBottomSheet(
                context: context,
                widget: const LanguagesBottomSheet(),
                isDarkMode: false);
          },
        ),
      ],
    );
  }
}
