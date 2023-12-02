import 'package:flutter/material.dart';

import 'package:moive_app_task/model/profile_model.dart';
import 'package:moive_app_task/view/custom_component/custom_preview_photo.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:moive_app_task/view_model/detailed_view_model.dart';

class DialogHelper {
  DialogHelper._();
  static DialogHelper? _instance;

  static DialogHelper get instance => _instance ??= DialogHelper._();

  void showCustomDialog(
      {required BuildContext context,
      required ProfileModel profileModel,
      required void Function()? onDownload}) {
    showGeneralDialog(
        context: context,
        barrierColor: Colors.black12.withOpacity(0.6), // Background color
        barrierDismissible: true,
        barrierLabel: 'Dialog',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, __, ___) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              CustomPreviewPhoto(profileModel: profileModel),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () =>
                        Get.find<DetailedViewModel>().onDismissPircture(),
                    child: const Text('Dismiss'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.find<DetailedViewModel>().downloadPicture();
                    },
                    child: const Text('download Picture'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
/*



Container(
            width: Get.size.width,
            height: Get.size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomPreviewPhoto(profileModel: profileModel),
              ],
            ),
          );


          /*.

return Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: SizedBox.expand(child: FlutterLogo()),
              ),
              Expanded(
                flex: 1,
                child: SizedBox.expand(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Dismiss'),
                  ),
                ),
              ),
            ],
          );


          */*





*/