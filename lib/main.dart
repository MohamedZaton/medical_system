import 'package:developer/presentation/pages/splash/splash_view.dart';
import 'package:developer/themes/get_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes/app_routes.dart';

void main() async {
  runApp(const MyApp());
  // DependencyInjection.init();
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
      getPages: AppRoutes.onGenerateRoutes(),
    );
  }
}
