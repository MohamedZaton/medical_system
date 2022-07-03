import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/title_button_widget.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/constants.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final logic = Get.put(ProfileLogic());
  static const String id = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          kProfileTxt,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileLogic>(builder: (controller) {
        return Container(
          width: ScreenDevices.width(context),
          height: ScreenDevices.heigth(context) * 0.80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  TitleButtonWidget(
                      title: controller.userName, onPressed: () {}),
                  SizedBox(height: 30),
                  TitleButtonWidget(
                      title: controller.phoneNumber, onPressed: () {}),
                  SizedBox(height: 20),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
