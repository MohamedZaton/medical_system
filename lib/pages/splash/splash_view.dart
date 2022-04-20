import 'package:developer/pages/sign_in_page/sign_in_view.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash";

  final logic = Get.put(SplashLogic());

  @override
  Widget build(BuildContext context) {
    double? targetValue = 2.0;

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Hero(
        tag: 'logo_splash',
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 2),
          builder: (context, value, Widget? child) {
            return FluxImage(imageUrl: 'assets/logo/logo.png');
          },
          child: FluxImage(imageUrl: 'assets/logo/logo.png'),
          onEnd: () async {
            Get.to(() => SignInPage());
          },
        ),
      ),
    );
  }
}
