import 'package:get/get.dart';

import '../../view_model/home_view_model.dart';

class HomeBinding implements Bindings {
  // SplashBinding() {
  //   Get.put(SplashViewModel());
  // }
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    //Get.put(HomeViewModel());
  }
}
