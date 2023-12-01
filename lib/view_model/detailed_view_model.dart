import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/service/api/repository_implementaion_service/pepole_repositry_service.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';

import '../model/profile_model.dart';
import '../model/profile_person_image_model.dart';

class DetailedViewModel extends GetxController {
  final int _currentIndexOfPersoninList =
      Get.find<HomeViewModel>().currentIndexOfPersoninList;
  late ResultsModel _pesronBasicInformation;
  final ValueNotifier<bool> _valueNotifierLoadImages = ValueNotifier(false);
  ProfilePersonImageModel? _profilePersonImageModel;
  List<ProfileModel> _imageList = [];
  bool get valueNotifierLoadImages => _valueNotifierLoadImages.value;
  ResultsModel get pesronBasicInformation => _pesronBasicInformation;

  List<ProfileModel> get imageList => _imageList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentPerson();
    print("OK");
  }

  void getCurrentPerson() {
    _pesronBasicInformation =
        Get.find<HomeViewModel>().peopleList[_currentIndexOfPersoninList];
  }

  void fetchPersonImage() async {
    int personId = _pesronBasicInformation.id!;
    _profilePersonImageModel =
        await PeopleRepositryService().getImages(personId: personId);
    _imageList = _profilePersonImageModel!.profiles!;
    _valueNotifierLoadImages.value = true;
    update();
  }
}
