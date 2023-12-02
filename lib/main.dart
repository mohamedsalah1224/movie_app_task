import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:moive_app_task/utils/constant.dart';
import 'package:moive_app_task/utils/routes.dart';

void main() {
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