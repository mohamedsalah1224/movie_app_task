import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moive_app_task/view/custom_component/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          100.verticalSpace,
          Center(
            child: Stack(
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
                              color: Colors.grey.shade400,
                              blurRadius: 2,
                              offset: Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.circular(12).r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        50.verticalSpace,
                        5.verticalSpace,
                        CustomText(
                          text: "Name : Mohamed salah Elkholy",
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        5.verticalSpace,
                        CustomText(
                          text: "Department : Acting",
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        5.verticalSpace,
                        CustomText(
                          text: "popularity : 12.5",
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                      child: CachedNetworkImage(
                        imageUrl: "https://www.almrsal.com/",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
