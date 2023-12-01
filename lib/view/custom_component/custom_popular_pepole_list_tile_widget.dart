import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/results_model.dart';
import '../../utils/end_point.dart';
import 'custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomPopularPepoleListTileWidget extends StatelessWidget {
  final ResultsModel resultsModel;
  const CustomPopularPepoleListTileWidget(
      {super.key, required this.resultsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12).r),
      child: ListTile(
        title: CustomText(wordCount: 15, text: resultsModel.name.toString()),
        subtitle: CustomText(
            wordCount: 15, text: resultsModel.knownForDepartment.toString()),
        trailing: Container(
          padding: REdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
          ),
          child: CustomText(
              // text: resultsModel.id.toString(),
              wordCount: 10, // to make a OverFolw when id more thean 10 char
              text: resultsModel.id.toString()),
        ),
        leading: SizedBox(
            width: 50.w,
            height: 50.h,
            child: CachedNetworkImage(
              imageUrl:
                  "${EndPoint.imagePath}${resultsModel.profilePath.toString()}",
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
              memCacheHeight: 50.h.toInt(),
              memCacheWidth: 50.w.toInt(),
            )

            /* 


 Image.network(fit: BoxFit.fill,
              errorBuilder: (context, exception, trace) {
            return const Center(
                child: CustomText(
              text: "No Image",
              textAlign: TextAlign.center,
            ));
          },
              cacheHeight: 50.h.toInt(),
              cacheWidth: 50.w.toInt(),
              "${EndPoint.imagePath}${resultsModel.profilePath.toString()}"),
          */
            ),
      ),
    );
  }
}
