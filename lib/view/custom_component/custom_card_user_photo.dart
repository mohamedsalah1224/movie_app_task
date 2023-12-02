// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moive_app_task/utils/end_point.dart';

class CustomCardUserPhoto extends StatelessWidget {
  final String? imageUrl;
  const CustomCardUserPhoto({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.w,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(12).r),
      child: CachedNetworkImage(
        imageUrl: "${EndPoint.imagePath}$imageUrl",
        placeholder: (context, url) => const CircularProgressIndicator(),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
