import 'package:get/get.dart';
import 'package:moive_app_task/view/screens/detailed_view.dart';

import '../view/screens/home_view.dart';
import 'binding/detailed_binding.dart';
import 'binding/home_binding.dart';

class Routes {
  static const String initialRoute = "/";
  static const String detailedView = "/detailedView";

  static List<GetPage<dynamic>>? getPages() => [
        GetPage(
          name: initialRoute,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: detailedView,
          page: () => const DetailedView(),
          binding: DetailedBinding(),
        ),
      ];
}
