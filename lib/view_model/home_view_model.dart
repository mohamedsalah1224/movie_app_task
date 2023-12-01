import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/popular_people_List_model.dart';
import '../model/results_model.dart';
import '../service/api/repository_implementaion_service/popular_people_list_repositry_servicel.dart';

class HomeViewModel extends GetxController {
  String inintHomeViewModel = "";
  ValueNotifier<bool> _isScreenLoaded = ValueNotifier(false);
  ScrollController scrollController = ScrollController();
  List<ResultsModel> _peopleList = [];
  int _pageID = 1;
  int _pageLimit = 156997;

  bool get isScreenLoaded => _isScreenLoaded.value;
  List<ResultsModel> get peopleList => _peopleList;

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_scrollListiner);
    await firstFetchData();
  }

  Future<void> _scrollListiner() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      ++_pageID;
      await fetchData();
      update();
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
