import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../model/status_of_download_image_at_gallary_model.dart';

class ImageGallarySaver {
  ImageGallarySaver._();
  static ImageGallarySaver? _instance;

  static ImageGallarySaver get instance => _instance ??= ImageGallarySaver._();

  Future<StatusOfDownloadedImageAtGallaryModel> saveNetworkImage(
      {required String url, required String name}) async {
    var response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name:
            "$name${DateTime.now().microsecondsSinceEpoch.toString()}"); // unique name base on the time zone
    debugPrint(result.toString());
    return StatusOfDownloadedImageAtGallaryModel(
        isSuccess: result['isSuccess'],
        errorMessage: result['errorMessage'] ?? "not erro",
        filePath: result['filePath']);
  }
}
