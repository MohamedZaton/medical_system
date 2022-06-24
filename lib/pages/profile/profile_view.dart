import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/constants.dart';
import '../../utils/screens.dart';
import '../../widgets/shadow_btn_widget.dart';
import '../../widgets/text_display_widget.dart';
import '../sign_in_page/sign_in_view.dart';
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
      body: Container(
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
                TextDisplayWidget(text: kNameDemo, onPressed: () {}),
                SizedBox(height: 30),
                TextDisplayWidget(text: kPhoneDemo, onPressed: () {}),
                SizedBox(height: 20),
                Padding(
                    padding: EdgeInsets.fromLTRB(60, 16, 60, 16),
                    child: ShadowButton(
                      name: kSignOutText,
                      onPressed: () {
                        return Get.to(() => SignInPage());
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
