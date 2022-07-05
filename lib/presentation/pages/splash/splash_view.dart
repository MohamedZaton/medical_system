import 'package:developer/data/services/local_data.dart';
import 'package:developer/presentation/pages/home/home_view.dart';
import 'package:developer/presentation/pages/sign_in_page/sign_in_view.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  static const String id = "/splash";

  final logic = Get.put(SplashLogic());

  @override
  Widget build(BuildContext context) {
    double? targetValue = 200;

    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Hero(
        tag: 'logo_splash',
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: targetValue),
          duration: const Duration(seconds: 2),
          builder: (context, value, Widget? child) {
            return FluxImage(
              imageUrl: kLogoAppImg,
              width: value,
              height: value,
            );
          },
          child: FluxImage(imageUrl: kLogoAppImg),
          onEnd: () async {
            if (await LocalData().readAcceptAutoLogin()) {
              return Get.to(() => HomePage());
            } else {
              return Get.to(() => SignInPage());
            }
          },
        ),
      ),
    );
  }
}
