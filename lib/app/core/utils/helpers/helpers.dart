import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart' show NumberFormat;

abstract class AppHelpers {
  static Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  static Future<BitmapDescriptor> setCustomMarkerIcon(
      {required String path, required int width}) async {
    final Uint8List markerMyIcon =
        await AppHelpers._getBytesFromAsset(path, width);
    return BitmapDescriptor.fromBytes(markerMyIcon);
  }

  static String numberFormat({num? number, String? symbol, bool? isOrder}) {
    // if (LocalStorage.instance.getSelectedCurrency()?.position == "before") {
    return NumberFormat.currency(
      customPattern: '\u00a4#,###.#',
      symbol: (isOrder ?? false)
          ? symbol
          : '\$', //LocalStorage.instance.getSelectedCurrency()?.symbol,
      decimalDigits: 2,
    ).format(number ?? 0);
    // } else {
    //   return NumberFormat.currency(
    //     customPattern: '#,###.#\u00a4',
    //     symbol: (isOrder ?? false)
    //         ? symbol
    //         : '\$',//LocalStorage.instance.getSelectedCurrency()?.symbol,
    //     decimalDigits: 2,
    //   ).format(number ?? 0);
    // }
  }

  static void displaySnackBar(BuildContext context, String message) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    });
  }

  static Future<void> showToast(
      {required String message, Color backgroundColor = Colors.red}) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
