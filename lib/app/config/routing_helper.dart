import 'package:flutter/material.dart';

Future<void> navigateNamedAndRemoveAll(BuildContext context,
    {required String route}) async {
  await Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
}
