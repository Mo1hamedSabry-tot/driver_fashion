import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/components/molecules/bottom_sheet/base_bottom_sheet.dart';
import '../../../../app/components/molecules/bottom_sheet/show_custom_bottom_sheet.dart';
import '../../../../app/components/molecules/custom_button.dart';
import '../../../../app/config/routes.dart';
import '../../../../app/core/utils/helpers/helpers.dart';
import '../../../../app/core/utils/theming/app_colors.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';
import '../../../../app/core/utils/value_managers/size_manager.dart';
import '../../bloc/login_bloc.dart';
import '../atoms/email_text_field.dart';
import '../atoms/forget_text_button.dart';
import '../atoms/password_text_field.dart';
import '../items/keep_me_logged_item.dart';
import '../molecules/app_bar_bottom_sheet.dart';
import 'reset_password_bottom_sheet.dart';

class LoginBottomSheet extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  LoginBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginFailure) {
          await AppHelpers.showToast(
            message: AppStrings.loginFailureMsg,
          );
        }
        if (state is LoginSuccess) {
          if (context.mounted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.homeRoute,
              (route) => false,
            );
          }
        }
      },
      builder: (context, state) {
        final loginRead = context.read<LoginBloc>();
        return BaseBottomSheet(
          height: SizeManager.loginBottomSheetHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.only(right: 12.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    BottomSheetAppBar(title: AppStrings.login, onTap: () {}),
                    20.verticalSpace,
                    //? email textfield
                    EmailTextField(controller: emailController),
                    34.verticalSpace,
                    //? password textfield
                    PasswordTextField(
                      controller: passwordController,
                      obsecure: context.watch<LoginBloc>().obsecure,
                      onVisibilityToggled: () {
                        loginRead.add(ToggleVisibilityEvent());
                      },
                    ),
                    30.verticalSpace,
                    //? keep logged checkbox and forget password button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const KeepMeLoggedItem(),
                        8.horizontalSpace,
                        ForgetPasswrodAtom(
                            title: AppStrings.forgetPassword,
                            onPressed: () {
                              showCustomModalBottomSheet(
                                  context: context,
                                  widget: ResetPasswordBottomSheet(),
                                  isDarkMode: false);
                            })
                      ],
                    ),
                    32.verticalSpace,
                    BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {},
                      child: CustomButton(
                        isLoading: state is LoginLoading,
                        title: AppStrings.login,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginRead.add(StartLoginEvent(
                              email: emailController.text,
                              password: passwordController.text,
                            ));
                          }
                        },
                        background: AppColors.primaryColor,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
