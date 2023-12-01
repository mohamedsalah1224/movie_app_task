import 'package:moive_app_task/view/screens/detailed_view.dart';
import 'package:get/get.dart';

class DetailedBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => const DetailedView());
  }
}
