import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moive_app_task/model/profile_model.dart';

class DialogHelper {
  DialogHelper._();
  static DialogHelper? _instance;

  static DialogHelper get instance => _instance ??= DialogHelper._();

  void showCustomDialog(
      {required BuildContext context, required ProfileModel profileModel}) {
    showDialog(
        context: context,
        builder: (context) {
          return Text('');
        });
  }
}
