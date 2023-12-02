import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moive_app_task/utils/end_point.dart';
import '../../model/results_model.dart';
import 'custom_text.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

class CustomProfileInformationDetailedView extends StatelessWidget {
  final ResultsModel resultsModel;
  const CustomProfileInformationDetailedView(
      {super.key, required this.resultsModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: 300.w,
            height: 150.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                boxShadow: [
                  BoxShadow(
                      color: Colors.deepPurple.shade400,
                      blurRadius: 2,
                      offset: const Offset(0, 5)),
                  BoxShadow(
                      color: Colors.deepPurple.shade400,
                      blurRadius: 2,
                      offset: const Offset(0, -5)),
                  BoxShadow(
                      color: Colors.deepPurple.shade400,
                      blurRadius: 2,
                      offset: const Offset(-5, -0)),
                  BoxShadow(
                      color: Colors.deepPurple.shade400,
                      blurRadius: 2,
                      offset: const Offset(5, 0)),
                ],
                borderRadius: BorderRadius.circular(12).r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                50.verticalSpace,
                5.verticalSpace,
                CustomText(
                  text: "Name : ${resultsModel.name}",
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  wordCount: 30,
                ),
                5.verticalSpace,
                CustomText(
                  text: "Department : ${resultsModel.knownForDepartment}",
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  wordCount: 30,
                ),
                5.verticalSpace,
                CustomText(
                  text: "popularity : ${resultsModel.popularity}",
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  wordCount: 30,
                ),
              ],
            ),
          ),
          Positioned(
            top: -55.h,
            child: Container(
              width: 100.w,
              height: 100.w,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepPurple),
              child: CachedNetworkImage(
                imageUrl: "${EndPoint.imagePath}${resultsModel.profilePath}",
                placeholder: (context, url) => CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple.shade100,
                  color: Colors.deepPurple,
                ),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ]);
  }
}
