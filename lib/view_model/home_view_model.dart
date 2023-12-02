import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moive_app_task/utils/routes.dart';

import '../model/popular_people_List_model.dart';
import '../model/results_model.dart';
import '../service/api/repository_implementaion_service/popular_people_list_repositry_servicel.dart';

class HomeViewModel extends GetxController {
  int currentIndexOfPersoninList = 1; // to share to anothe Controller
  final ValueNotifier<bool> _isScreenLoaded = ValueNotifier(false);
  ScrollController scrollController = ScrollController();
  final List<ResultsModel> _peopleList = [];
  int _pageID = 1;
  int _pageLimit = 3; // 156997
  bool hasMoreData = false;
  bool allPagesDownloaded = false;

  bool get isScreenLoaded => _isScreenLoaded.value;
  List<ResultsModel> get peopleList => _peopleList;

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_scrollListiner);
    await firstFetchData();
  }

  Future<void> _scrollListiner() async {
    // to skip the Call Back hell for this method and prevent it from calling the Api when make a Scroll multiple time during the progrss indicator run
    if (hasMoreData || allPagesDownloaded) return;

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      hasMoreData = true;
      update(); // update the progress indicaotr
      ++_pageID; // to go the next page

      // to check if the All Pages Called from the Api
      if (_pageID > _pageLimit) {
        allPagesDownloaded = true;

        update();
        return;
      }
      await fetchData();
      update();
      hasMoreData = false; //to enter this function agagin
      update(); // update the list
    }
  }

  Future<void> firstFetchData() async {
    _isScreenLoaded.value = false;
    await fetchData().then((value) {
      _isScreenLoaded.value = true;
      update();
    });
  }

  Future<void> fetchData() async {
    PopularPeopleListModel popularPeopleListModel =
        await PopularPeopleListRepositryService().getPopular(pageID: _pageID);
    _pageLimit = popularPeopleListModel.totalPages!;
    _peopleList.addAll(popularPeopleListModel.results ?? []);
  }

  void clickPerson(int index) {
    currentIndexOfPersoninList = index;
    Get.toNamed(Routes.detailedView);
  }
}
