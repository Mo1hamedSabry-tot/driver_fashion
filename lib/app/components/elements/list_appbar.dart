import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../molecules/appbar/custom_app_bar.dart';

class ListAppBar extends StatelessWidget {
  final Widget child;

  const ListAppBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(padding: REdgeInsets.all(16), child: child);
  }
}
