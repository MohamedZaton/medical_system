import 'package:developer/pages/sign_in_page/sign_in_view.dart';
import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/constants.dart';
import '../../widgets/shadow_btn_widget.dart';
import '../../widgets/text_display_widget.dart';
import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  static const String id = "/setting";

  final logic = Get.put(SettingLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          FloatingActionButton(
            heroTag: "setting_profile_btn",
            backgroundColor: kDarkAccent,
            onPressed: () {},
            child: Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
      body: Container(
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
