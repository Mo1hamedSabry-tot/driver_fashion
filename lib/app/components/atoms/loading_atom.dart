import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/theming/app_colors.dart';

class LoadingAtom extends StatelessWidget {
  final Color backgroundColor;

  const LoadingAtom({Key? key, this.backgroundColor = AppColors.greyColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: AppColors.primaryColor,
              strokeWidth: 5.w,
            )
          : CupertinoActivityIndicator(
              radius: 12.r,
              color: AppColors.primaryColor,
            ),
    );
  }
}
