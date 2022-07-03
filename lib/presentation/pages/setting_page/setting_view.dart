import 'package:developer/core/utils/images_path.dart';
import 'package:developer/tools/colors.dart';
import 'package:developer/widgets/oval_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/screens.dart';
import '../../../tools/constants.dart';
import '../profile/profile_view.dart';
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
            backgroundColor: kLightAccent,
            onPressed: () {
              Get.to(() => ProfilePage());
            },
            child: Icon(
              Icons.person_outline_rounded,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
      body: GetBuilder<SettingLogic>(
        assignId: true,
        builder: (controller) {
          return Container(
            width: ScreenDevices.width(context),
            height: ScreenDevices.heigth(context) * 0.80,
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      OvalButtonWdgt(
                        text: kWhatsappTxt,
                        imagePath: kWhatsAppImg,
                        isCenter: false,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      OvalButtonWdgt(
                        text: kFacebookTxt,
                        imagePath: kFaceBookAppImg,
                        isCenter: false,
                        onPressed: () {
                          launchUrl(
                            Uri.parse(controller.facebookPage),
                          );
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      OvalButtonWdgt(
                        text: kLanguageTxt,
                        imagePath: kLanguageImg,
                        isCenter: false,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      OvalButtonWdgt(
                        text: kShareAppTxt,
                        imagePath: kShareAppImg,
                        isCenter: false,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      OvalButtonWdgt(
                        text: kRateAppTxt,
                        imagePath: kRateImg,
                        isCenter: false,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      OvalButtonWdgt(
                        text: kAboutAppTxt,
                        imagePath: kAboutImg,
                        isCenter: false,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 6,
                      ),

                      /// SignOut button
                      OvalButtonWdgt(
                        text: kSignOutText,
                        isCenter: true,
                        onPressed: () {
                          controller.signOutProcess();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
