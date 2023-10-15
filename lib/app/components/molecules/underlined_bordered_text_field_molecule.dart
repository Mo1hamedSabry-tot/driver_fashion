import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderlinedBorderTextFieldMolecule extends StatelessWidget {
  final String label;
  final String? hint;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final Color textColor;
  final Color shimmerBase;
  final bool isDark;
  final String? Function(String?)? validator;

  const UnderlinedBorderTextFieldMolecule({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.obscure,
    this.onChanged,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
    this.hint,
    this.onTap,
    this.textColor = Colors.black,
    this.shimmerBase = const Color(0xFFE0E0E0),
    this.isDark = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bool isDark = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: validator,
          onTap: onTap,
          onChanged: onChanged,
          obscureText: (obscure ?? false),
          obscuringCharacter: '*',
          controller: textController,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white : Colors.black,
          ),
          cursorWidth: 1,
          cursorColor: isDark ? Colors.white : Colors.black,
          keyboardType: inputType,
          initialValue: initialText,
          readOnly: readOnly,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(
                maxHeight: suffixIcon != null ? 80 : 30,
                maxWidth: suffixIcon != null ? 80 : 30),
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: isDark ? Colors.white : textColor,
            ),
            labelText: label.toUpperCase(),
            labelStyle: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: shimmerBase)),
            errorBorder: InputBorder.none,
            border: const UnderlineInputBorder(),
            focusedErrorBorder: const UnderlineInputBorder(),
            disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: shimmerBase)),
            focusedBorder: const UnderlineInputBorder(),
          ),
        ),
        if (descriptionText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 4,
              ),
              Text(
                descriptionText!,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                  fontSize: 12,
                  color: isError
                      ? Colors.red
                      : isSuccess
                          ? textColor
                          : Colors.black,
                ),
              ),
            ],
          )
      ],
    );
  }
}
