import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moive_app_task/view/custom_component/custom_text.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        itemCount: controller.hasMoreData ||
                                controller.allPagesDownloaded
                            ? controller.peopleList.length + 1
                            : controller.peopleList.length,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.white,
                          );
                        },
                        itemBuilder: (context, index) {
                          if (index < controller.peopleList.length) {
                            return CustomPopularPepoleListTileWidget(
                                resultsModel: controller.peopleList[index]);
                          } else {
                            if (controller.hasMoreData) {
                              return const CircularProgressIndicator();
                            } else {
                              return Center(
                                child: Padding(
                                  padding: REdgeInsets.symmetric(vertical: 12),
                                  child: CustomText(text: "No More Data"),
                                ),
                              );
                            }
                          }
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
