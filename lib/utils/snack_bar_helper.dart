import 'package:flutter/material.dart';

import 'constant.dart';

class SnackBarHelper {
  SnackBarHelper._();
  static SnackBarHelper? _instance;

  static SnackBarHelper get instance => _instance ??= SnackBarHelper._();

  showMessage({required String message}) {
    ScaffoldMessenger.of(navigatorKey.currentState!.context)
        .showSnackBar(SnackBar(
      elevation: 0.0,
      //behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: const Duration(seconds: 1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      //backgroundColor: Colors.redAccent,
      // action: SnackBarAction(
      //   textColor: Color(0xFFFAF2FB),
      //   label: 'OK',
      //   onPressed: () {},
      // ),
    ));
  }
}
