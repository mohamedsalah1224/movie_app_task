import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/view/custom_component/custom_card_user_photo.dart';
import 'package:moive_app_task/view_model/detailed_view_model.dart';
import 'package:get/get.dart';
import '../custom_component/custom_profile_information_detailed_view.dart';

class DetailedView extends GetView<DetailedViewModel> {
  const DetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            100.verticalSpace,
            Center(
              child: CustomProfileInformationDetailedView(
                resultsModel: controller.pesronResultModel
              ),
            ),
            30.verticalSpace,
            GetBuilder(
              builder: (controller){
                return controller.i
              },
            )
          ],
        ),
      ),
    );
  }
}
