import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moive_app_task/model/profile_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils/end_point.dart';

class CustomPreviewPhoto extends StatelessWidget {
  const CustomPreviewPhoto({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: profileModel.height!.h,
      width: profileModel.width!.w,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color(0xFFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(32.0)).r,
      ),
      child: CachedNetworkImage(
        imageUrl: "${EndPoint.imagePath}${profileModel.filePath}",
        placeholder: (context, url) => const CircularProgressIndicator(),
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
