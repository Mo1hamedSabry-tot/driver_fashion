import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app/components/atoms/buttons_bouncing_effect.dart';

class BottomSheetAppBar extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BottomSheetAppBar({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BouncingEffect(
          child: GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
        Text(title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            )),
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.all(8),
        ),
      ],
    );
  }
}
