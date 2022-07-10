import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../tools/constants.dart';
import '../utils/images_path.dart';

class NetworkStatusService extends GetxService {
  NetworkStatusService() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');

          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          Get.snackbar(
            "Connection",
            kNoNetworkTxt,
            backgroundColor: Colors.red,
            icon: FluxImage(imageUrl: kOfflineImg),
          );

          /*          Get.dialog(
              MessageImgButtonWdgt(
                imageUrl: kOfflineImg,
                message: kNoNetworkTxt,
                button: TitleButtonWidget(
                  title: kTryAgainTxt,
                  onPressed: () {
                    Get.to(() => SplashPage());
                  },
                ),
              ),
              useSafeArea: false);*/
          break;
      }
    });
  }
}
