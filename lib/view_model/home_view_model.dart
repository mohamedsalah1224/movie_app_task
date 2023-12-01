import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/popular_people_List_model.dart';
import '../model/results_model.dart';
import '../service/api/repository_implementaion_service/popular_people_list_repositry_servicel.dart';

class HomeViewModel extends GetxController {
  String inintHomeViewModel = "";
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
    if (hasMoreData || allPagesDownloaded) return;

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // to check if the All Pages Called from the Api

      // to skip the Call Back hell for this method and prevent it from calling the Api when make a Scroll multiple time during the progrss indicator run

      hasMoreData = true;
      update(); // update the progress indicaotr
      ++_pageID; // to go the next page
      if (_pageID > _pageLimit) {
        allPagesDownloaded = true;

        print("-" * 50);
        print("OK OK");
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
}
