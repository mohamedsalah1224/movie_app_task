import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInterceptors extends Interceptor {
  final Dio dio;

  DioInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Before Any Request Send this Header
    options.headers['Accept'] = "accept: application/json";
    options.headers['Authorization'] =
        dotenv.get('ACESS_TOKEN'); // Save the Acess Token in the .ENV File

    //  var accessToken = await TokenRepository().getAccessToken();

    // if (accessToken != null) {
    //   var expiration = await TokenRepository().getAccessTokenRemainingTime();

    //   if (expiration.inSeconds < 60) {
    //     dio.interceptors.requestLock.lock();

    //     // Call the refresh endpoint to get a new token
    //     await UserService()
    //         .refresh()
    //         .then((response) async {
    //       await TokenRepository().persistAccessToken(response.accessToken);
    //       accessToken = response.accessToken;
    //     }).catchError((error, stackTrace) {
    //       handler.reject(error, true);
    //     }).whenComplete(() => dio.interceptors.requestLock.unlock());
    //   }

    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    return handler.next(options);
  }
}
