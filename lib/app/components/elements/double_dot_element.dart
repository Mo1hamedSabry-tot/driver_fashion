import 'package:flutter/material.dart';

import '../atoms/dot_atom.dart';

class DoubleDotElement extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const DoubleDotElement(
      {super.key, this.padding = const EdgeInsets.only(left: 14)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DotAtom(),
          DotAtom(),
        ],
      ),
    );
  }
}
