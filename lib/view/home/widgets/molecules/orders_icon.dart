import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/core/utils/theming/app_colors.dart';
import '../atoms/badge_child_atom.dart';
import '../atoms/badge_icon_atom.dart';

class OrdersIcon extends StatelessWidget {
  final String count;

  const OrdersIcon({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Badge(
      largeSize: 18.sp,
      backgroundColor: AppColors.transparent,
      alignment: Alignment.lerp(Alignment.topRight, Alignment.bottomLeft, 0.2),
      label: BadgeIconAtom(
        count: count,
      ),
      child: const BadgeChildAtom(),
    );
  }
}
