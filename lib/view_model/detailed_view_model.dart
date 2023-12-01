import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/service/api/repository_implementaion_service/pepole_repositry_service.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';

import '../model/profile_person_image_model.dart';

class DetailedViewModel extends GetxController {
  int currentIndexOfPersoninList =
      Get.find<HomeViewModel>().currentIndexOfPersoninList;
  late ResultsModel pesronModel;
  ValueNotifier<bool> isLoadImages = ValueNotifier(false);
  ProfilePersonImageModel? profilePersonImageModel;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentPerson();
    print("OK");
  }

  void getCurrentPerson() {
    pesronModel =
        Get.find<HomeViewModel>().peopleList[currentIndexOfPersoninList];
  }

  void fetchPersonImage() async {
    int personId = pesronModel.id!;
    profilePersonImageModel =
        await PeopleRepositryService().getImages(personId: personId);
    isLoadImages.value = true;
    update();
  }
}
