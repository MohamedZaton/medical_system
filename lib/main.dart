import 'package:developer/pages/home/home_logic.dart';
import 'package:developer/pages/sign_in_page/sign_in_logic.dart';
import 'package:developer/pages/sign_in_page/sign_in_view.dart';
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
          name: SignInPage.id,
          page: () => SignInPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut<SignInLogic>(() => SignInLogic());
          }),
        ),
      ],
    );
  }
}
