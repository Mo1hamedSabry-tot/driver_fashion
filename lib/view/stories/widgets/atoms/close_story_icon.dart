import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../../../app/core/utils/theming/app_colors.dart';

class CloseStoryIcon extends StatelessWidget {
  const CloseStoryIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          FlutterRemix.close_fill,
          color: AppColors.white,
          size: 30,
        ),
      ),
    );
  }
}
