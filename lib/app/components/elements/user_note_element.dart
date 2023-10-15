import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/theming/app_colors.dart';
import '../../core/utils/theming/app_fonts.dart';

class UserNoteElement extends StatelessWidget {
  final String? note;

  const UserNoteElement({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return note == null
        ? const SizedBox.shrink()
        : Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FlutterRemix.chat_1_fill),
                12.horizontalSpace,
                Expanded(
                  child: Text(
                    note!,
                    style: AppFontStyles.interRegular(
                        size: 13, color: AppColors.blackColor),
                  ),
                )
              ],
            ),
          );
  }
}
