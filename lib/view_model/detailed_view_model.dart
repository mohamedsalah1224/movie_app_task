import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/service/api/repository_implementaion_service/pepole_repositry_service.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';

import '../model/profile_person_image_model.dart';

class DetailedViewModel extends GetxController {
  final int _currentIndexOfPersoninList =
      Get.find<HomeViewModel>().currentIndexOfPersoninList;
  late ResultsModel _pesronResultModel;
  final ValueNotifier<bool> _valueNotifierLoadImages = ValueNotifier(false);
  ProfilePersonImageModel? _profilePersonImageModel;

  bool get valueNotifierLoadImages => _valueNotifierLoadImages.value;
  ProfilePersonImageModel get profilePersonImageModel =>
      _profilePersonImageModel!;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentPerson();
    print("OK");
  }

  void getCurrentPerson() {
    _pesronResultModel =
        Get.find<HomeViewModel>().peopleList[_currentIndexOfPersoninList];
  }

  void fetchPersonImage() async {
    int personId = _pesronResultModel.id!;
    _profilePersonImageModel =
        await PeopleRepositryService().getImages(personId: personId);
    _valueNotifierLoadImages.value = true;
    update();
  }
}
