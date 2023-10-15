import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/app/core/utils/theming/app_colors.dart';
import 'package:test_project/app/core/utils/value_managers/app_strings.dart';
import 'package:test_project/view/login/bloc/login_bloc.dart';
import 'package:test_project/view/login/widgets/atoms/keep_logged_checkbox.dart';

class KeepMeLoggedItem extends StatelessWidget {
  const KeepMeLoggedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LoginBloc, LoginState>(builder: (context, loginState) {
          return KeepLoggedCheckbox(
            length: 20.w,
            isChecked: context.watch<LoginBloc>().keepMeLogged,
            onChanged: (isChecked) {
              context.read<LoginBloc>().add(ToggleKeepMeLoggedEvent());
            },
          );
        }),
        8.horizontalSpace,
        Text(
          AppStrings.keepMeLoggedIn,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
