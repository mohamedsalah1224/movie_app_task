import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:moive_app_task/model/known_for__model.dart';
import 'package:moive_app_task/model/results_model.dart';
import 'package:moive_app_task/service/local/cache_pepole_list.dart';
import 'package:moive_app_task/utils/constant.dart';
import 'package:moive_app_task/utils/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  Hive.registerAdapter(ResultsModelAdapter());
  Hive.registerAdapter(KnownForModelAdapter());
  await CachePepoleList.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          navigatorKey: navigatorKey,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.initialRoute,
          getPages: Routes.getPages(),
        );
      },
    );
  }
}
/*
MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // locale: Locale("ar"),

      home: const ManageBottomNavigationView(),
    );

*/