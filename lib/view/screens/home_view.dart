import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';

import '../../model/results_model.dart';
import '../../service/api/repository_implementaion_service/popular_people_list_repositry_servicel.dart';
import '../custom_component/custom_popular_pepole_list_tile_widget.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: TextButton(
              child: Text('Get Api Pepole'),
              onPressed: () async {
                await PopularPeopleListRepositryService()
                    .getPopular(pageID: 100);
              },
            ),
          ),
          Expanded(
            child: GetBuilder<HomeViewModel>(
              init: Get.find<HomeViewModel>(),
              builder: (controller) {
                return controller.isScreenLoaded
                    ? ListView.separated(
                        controller: controller.scrollController,
                        itemCount: controller.peopleList.length + 1,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.white,
                          );
                        },
                        itemBuilder: (context, index) {
                          if (index < controller.peopleList.length) {
                            return CustomPopularPepoleListTileWidget(
                                resultsModel: controller.peopleList[index]);
                          }
                          return CustomPopularPepoleListTileWidget(
                            resultsModel: ResultsModel(
                              id: 45,
                              profilePath: "flsdfk",
                              knownForDepartment:
                                  "MohamedMohamedMohamedMohamed",
                              name: "MohamedMohamedMohamedMohamed",
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
