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
                        onPressed: () {
                          numbersDialog(context, controller.numbersWatsappList);
                        },
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
                        onPressed: () {
                          aboutDialog(context, controller.aboutText);
                        },
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

  Future<dynamic> numbersDialog(
      BuildContext context, List<String> numbersWatsAppList) {
    return Get.defaultDialog(
      title: "Select WhatsApp Number ",
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.green),
      backgroundColor: Colors.white,
      content: Container(
        height: ScreenDevices.heigth(context) * 0.2,
        width: ScreenDevices.width(context) * 0.8,
        child: ListView(
          children: numbersWatsAppList
              .map(
                (item) => Column(
                  children: [
                    OvalButtonWdgt(
                      text: item,
                      imagePath: kWhatsAppImg,
                      onPressed: () async {
                        var whatsappUrl = "whatsapp://send?phone=$item";
                        await canLaunchUrl(Uri.parse(whatsappUrl))
                            ? launchUrl(Uri.parse(whatsappUrl))
                            : print(
                                "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                        Get.back();
                      },
                    ),
                    SizedBox(
                      height: 6,
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Future<dynamic> aboutDialog(BuildContext context, String about) {
    return Get.defaultDialog(
      title: "حول التطبيق",
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.green),
      backgroundColor: Colors.white,
      content: Container(
        alignment: Alignment.centerRight,
        height: ScreenDevices.heigth(context) * (about.length * 0.001),
        width: ScreenDevices.width(context) * 0.8,
        child: Text(
          about,
          softWrap: true,
          textDirection: TextDirection.rtl,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: kDarkAccent),
        ),
      ),
    );
  }
}
