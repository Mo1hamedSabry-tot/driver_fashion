import 'package:flutter/material.dart';

import '../../core/utils/theming/app_fonts.dart';

class DeliveriesTitleText extends StatelessWidget {
  const DeliveriesTitleText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppFontStyles.interSemi(size: 18),
    );
  }
}
