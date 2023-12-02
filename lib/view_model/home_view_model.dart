import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moive_app_task/service/local/cache_pepole_list.dart';
import 'package:moive_app_task/utils/check_connection_helper.dart';
import 'package:moive_app_task/utils/routes.dart';
import 'package:moive_app_task/utils/snack_bar_helper.dart';

import '../model/popular_people_List_model.dart';
import '../model/results_model.dart';
import '../service/api/repository_implementaion_service/popular_people_list_repositry_servicel.dart';

class HomeViewModel extends GetxController {
  int currentIndexOfPersoninList = 1; // to share to anothe Controller
  final ValueNotifier<bool> _isScreenLoaded = ValueNotifier(false);
  ScrollController scrollController = ScrollController();
  final List<ResultsModel> _peopleList = [];
  int _pageID = 1;
  int _pageLimit =
      10; // defualt data of server = 156997 but I Set a 10 to Handle when the API No More Data
  bool hasMoreData = false;
  bool allPagesDownloaded = false;
  bool isInternetConection = true;

  bool get isScreenLoaded => _isScreenLoaded.value;
  List<ResultsModel> get peopleList => _peopleList;

  @override
  void onInit() async {
    super.onInit();
    await checkFetchDataMethod();
    scrollController.addListener(_scrollListiner);
  }

  Future<void> _scrollListiner() async {
    if (!isInternetConection) return;
    // to skip the Call Back hell for this method and prevent it from calling the Api when make a Scroll multiple time during the progrss indicator run
    if (hasMoreData || allPagesDownloaded) return;

    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      hasMoreData = true;
      update(); // update the progress indicaotr
      ++_pageID; // to go the next page
//////////////////////////////////////////////////////////////////
      // to check if the All Pages Called from the Api or not
      if (_pageID > _pageLimit) {
        allPagesDownloaded = true;
        hasMoreData =
            false; // to delete the Cricle Progrss because it will always true before this body
        update();
        return;
      }
//////////////////////////////////////////////////////////////////
      await fetchDataFromNetwork();
      update();
      hasMoreData =
          false; //to enter this function agagin and help it to make more scrole
      update(); // update the list
    }
  }

  Future<void> firstFetchData() async {
    _isScreenLoaded.value = false;
    // delte all Cache and Clear list of Cache first to avoid duplicated of data
    await CachePepoleList.instance.clearAllPosts();
    await fetchDataFromNetwork().then((value) {
      _isScreenLoaded.value = true;
      update();
    });
  }

  Future<void> fetchDataFromNetwork() async {
    PopularPeopleListModel popularPeopleListModel =
        await PopularPeopleListRepositryService().getPopular(pageID: _pageID);
    // _pageLimit = popularPeopleListModel.totalPages!;
    //// we can make this every request to update the chagnes can will be (like profile removed) this mean the pageId ca be decreased but I Disable it now to Check the PageLimit with 3
    _peopleList.addAll(popularPeopleListModel.results ?? []);
    updateCahce(listResultModel: popularPeopleListModel.results ?? [])
        .then((value) => null); // use then to skip the freeze UI
  }

  void fetchDataFromCache() {
    _peopleList.addAll(CachePepoleList.instance.getPostsCache());
    _isScreenLoaded.value = true;
    update();
  }

  Future<void> checkFetchDataMethod() async {
    // How get Data from Cache or Netwok
    bool isConnection = await CheckConnectionHelper.checkConnection();
    if (isConnection) {
      await firstFetchData();
    } else {
      isInternetConection = false;
      fetchDataFromCache();
    }
  }

  Future<void> updateCahce(
      {required List<ResultsModel> listResultModel}) async {
    // Add newResult to the Cache when fetch a new Data
    await CachePepoleList.instance.udatePostsCache(values: listResultModel);
  }

  void clickPerson(int index) {
    if (!isInternetConection) {
      SnackBarHelper.instance.showMessage(
          message:
              'No Internet Connection Please check Internet and ReOpen the App again',
          milliseconds: 1300,
          erro: true);
      return;
    }
    currentIndexOfPersoninList = index;
    Get.toNamed(Routes.detailedView);
  }
}
