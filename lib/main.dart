import 'package:developer/pages/delivery_page/delivery_logic.dart';
import 'package:developer/pages/delivery_page/delivery_view.dart';
import 'package:developer/pages/department_page/depart_logic.dart';
import 'package:developer/pages/department_page/depart_view.dart';
import 'package:developer/pages/home/home_logic.dart';
import 'package:developer/pages/setting_page/setting_logic.dart';
import 'package:developer/pages/setting_page/setting_view.dart';
import 'package:developer/pages/sign_up_page/sigin_up_logic.dart';
import 'package:developer/pages/sign_up_page/sigin_up_view.dart';
import 'package:developer/pages/splash/splash_logic.dart';
import 'package:developer/pages/splash/splash_view.dart';
import 'package:developer/themes/get_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Medical System',
      debugShowCheckedModeBanner: false,
      theme: buildLightTheme(),
      initialRoute: SplashPage.id,
      getPages: [
        GetPage(
          name: HomePage.id,
          page: () => HomePage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<HomeLogic>(() => HomeLogic());
          }),
        ),
        GetPage(
          name: SplashPage.id,
          page: () => SplashPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SplashLogic>(() => SplashLogic());
          }),
        ),
        GetPage(
          name: SignUpPage.id,
          page: () => SignUpPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SignUpLogic>(() => SignUpLogic());
          }),
        ),
        GetPage(
          name: SettingPage.id,
          page: () => SettingPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SettingLogic>(() => SettingLogic());
          }),
        ),
        GetPage(
          name: DepartmentPage.id,
          page: () => DepartmentPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<DepartmentLogic>(() => DepartmentLogic());
          }),
        ),
        GetPage(
          name: DeliveryPage.id,
          page: () => DeliveryPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<DeliveryLogic>(() => DeliveryLogic());
          }),
        ),
      ],
    );
  }
}
