import 'package:get/get.dart';
import 'package:moive_app_task/view_model/detailed_view_model.dart';

class DetailedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailedViewModel());
  }
}
