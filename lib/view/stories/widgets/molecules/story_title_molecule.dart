import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/theming/app_fonts.dart';
import '../../../../domain/stories/entities/story_entity.dart';

class StoryTitle extends StatelessWidget {
  final StoryEntity storyModel;

  const StoryTitle({
    super.key,
    required this.storyModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(),
          Text(
            storyModel.title,
            style: AppFontStyles.interNormal(size: 32, color: AppColors.white),
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
