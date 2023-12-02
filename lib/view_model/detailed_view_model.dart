import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/service/api/repository_implementaion_service/pepole_repositry_service.dart';
import 'package:moive_app_task/utils/dialog_helper.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';

import '../model/profile_model.dart';
import '../model/profile_person_image_model.dart';

class DetailedViewModel extends GetxController {
  final int _currentIndexOfPersoninList = Get.find<HomeViewModel>()
      .currentIndexOfPersoninList; // communication to another controller to get the currentIndex of the person instead of using arguments
  late ResultsModel _pesronBasicInformation;
  final ValueNotifier<bool> _valueNotifierLoadImages = ValueNotifier(false);
  ProfilePersonImageModel? _profilePersonImageModel;
  List<ProfileModel> _imageList = [];
  bool get valueNotifierLoadImages => _valueNotifierLoadImages.value;
  ResultsModel get pesronBasicInformation => _pesronBasicInformation;

  List<ProfileModel> get imageList => _imageList;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getCurrentPerson();
    await fetchPersonImage();
  }

  void getCurrentPerson() {
    _pesronBasicInformation =
        Get.find<HomeViewModel>().peopleList[_currentIndexOfPersoninList];
  }

  Future<void> fetchPersonImage() async {
    int personId = _pesronBasicInformation.id!;
    _profilePersonImageModel =
        await PeopleRepositryService().getImages(personId: personId);
    _imageList = _profilePersonImageModel!.profiles!;
    _valueNotifierLoadImages.value = true;
    update();
  }

  void previewPhoto(
    BuildContext context, {
    required ProfileModel profileModel,
  }) {
    DialogHelper.instance.showCustomDialog(
      context: context,
      profileModel: profileModel,
      onDownload: downloadPicture,
    );
  }

  void downloadPicture() {
    print("Download");
  }

  void onDismissPircture() {
    Get.back();
  }
}
