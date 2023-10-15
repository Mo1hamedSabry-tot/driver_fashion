import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';

import '../../../../app/components/molecules/underlined_bordered_text_field_molecule.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obsecure;
  final VoidCallback? onVisibilityToggled;

  const PasswordTextField({
    super.key,
    this.controller,
    this.validator,
    this.obsecure = true,
    this.onVisibilityToggled,
  });

  @override
  Widget build(BuildContext context) {
    return UnderlinedBorderTextFieldMolecule(
      textController: controller,
      obscure: obsecure,
      label: AppStrings.password,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.none,
      isDark: false,
      suffixIcon: GestureDetector(
          onTap: onVisibilityToggled,
          child: Icon(
              obsecure ? FlutterRemix.eye_line : FlutterRemix.eye_close_line)),
      validator: validator ??
          (vlaue) {
            return (controller?.text != null && controller!.text.isNotEmpty)
                ? null
                : "Please Enter a valid password";
          },
    );
  }
}
