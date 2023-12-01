import 'package:get/get.dart';

import '../view/screens/home_view.dart';
import 'binding/home_binding.dart';

class Routes {
  static const String initialRoute = "/";

  static List<GetPage<dynamic>>? getPages() => [
        GetPage(
          name: initialRoute,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ];
}
