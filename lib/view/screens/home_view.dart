import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moive_app_task/view/custom_component/custom_text.dart';
import 'package:moive_app_task/view_model/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../custom_component/custom_popular_pepole_list_tile_widget.dart';

class HomeView extends GetView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Colors.grey.shade400,
      backgroundColor: Colors.deepPurple.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: GetBuilder<HomeViewModel>(
                init: Get.find<HomeViewModel>(),
                builder: (controller) {
                  return controller.isScreenLoaded
                      ? controller.peopleList.isEmpty
                          ? const Center(
                              child: CustomText(
                                text: 'No Data founded',
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          : ListView.separated(
                              controller: controller.scrollController,
                              itemCount: (controller.hasMoreData ||
                                      controller.allPagesDownloaded)
                                  ? controller.peopleList.length + 1
                                  : controller.peopleList.length,
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  color: Colors.white,
                                );
                              },
                              itemBuilder: (context, index) {
                                if (index < controller.peopleList.length) {
                                  return InkWell(
                                    onTap: () {
                                      controller.clickPerson(index);
                                    },
                                    child: CustomPopularPepoleListTileWidget(
                                        resultsModel:
                                            controller.peopleList[index]),
                                  );
                                } else {
                                  if (controller.hasMoreData) {
                                    return Transform.scale(
                                      scale: 1,
                                      child: Center(
                                        child: Padding(
                                          padding: REdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CircularProgressIndicator(
                                            backgroundColor:
                                                Colors.deepPurple.shade100,
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Center(
                                      child: Padding(
                                        padding:
                                            REdgeInsets.symmetric(vertical: 12),
                                        child: const CustomText(
                                          text: "No More Data",
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }
                                }
                              },
                            )
                      : Center(
                          child: Transform.scale(
                            scale: 2,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.deepPurple.shade100,
                              color: Colors.deepPurple,
                            ),
                          ),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
