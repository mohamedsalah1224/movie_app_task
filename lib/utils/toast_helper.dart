import 'package:flutter/material.dart';

class SnackBarHelper {
  SnackBarHelper._();
  static SnackBarHelper? _instance;

  static SnackBarHelper get instance => _instance ??= SnackBarHelper._();

  showMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0.0,
      //behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: const Duration(seconds: 5000000),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
      ),
      //backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        textColor: Color(0xFFFAF2FB),
        label: 'OK',
        onPressed: () {},
      ),
    ));
  }
}
