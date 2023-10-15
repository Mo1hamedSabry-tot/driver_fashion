import 'package:flutter/material.dart';

import '../../../../app/components/molecules/underlined_bordered_text_field_molecule.dart';
import '../../../../app/core/utils/value_managers/app_strings.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const EmailTextField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return UnderlinedBorderTextFieldMolecule(
      label: AppStrings.userName,
      isDark: false,
      inputType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      textController: controller,
      validator: validator ??
          (value) {
            return (controller?.text != null && controller!.text.isNotEmpty)
                ? null
                : AppStrings.enterValidUserName;
          },
    );
  }
}
