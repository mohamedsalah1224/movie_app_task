import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utils/end_point.dart';
import 'dio_Interceptors.dart';

class DioHelper {
  final _dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: EndPoint.baseUrl));

  DioHelper._internal();

  static final _singleton = DioHelper._internal();

  Dio get dio => _dio;

  factory DioHelper() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: EndPoint.baseUrl,
      receiveTimeout: const Duration(seconds: 50), // 15 seconds
      connectTimeout: const Duration(seconds: 50),
      sendTimeout: const Duration(seconds: 50),
    ));

    dio.interceptors.addAll({
      DioInterceptors(dio),
    });

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          error: true,
          responseBody: true,
          request: true));
    }
    return dio;
  }
}
