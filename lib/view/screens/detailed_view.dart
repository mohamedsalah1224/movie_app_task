import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/view/custom_component/custom_card_user_photo.dart';
import 'package:moive_app_task/view/custom_component/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../custom_component/custom_profile_information_detailed_view.dart';

class DetailedView extends StatelessWidget {
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
                resultsModel: ResultsModel(
                    name: "Ahmed salahAhmed salahAhmed salahAhmed salah",
                    knownForDepartment: "Acting Acting Acting",
                    popularity: 44554345455455.454),
              ),
            ),
            30.verticalSpace,
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30.h,
                      crossAxisSpacing: 15.w),
                  itemCount: 80,
                  itemBuilder: (context, index) {
                    return const CustomCardUserPhoto(
                      imageUrl: "",
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
