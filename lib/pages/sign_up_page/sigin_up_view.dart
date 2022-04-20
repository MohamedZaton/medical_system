import 'package:developer/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/constants.dart';
import '../../widgets/edit_text_widget.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/shadow_btn_widget.dart';
import 'sigin_up_logic.dart';

class SignUpPage extends StatelessWidget {
  static const String id = "/sign_up";

  final logic = Get.put(SignUpLogic());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Hero(
                  tag: 'logo_splash',
                  child: FluxImage(
                    imageUrl: 'assets/logo/logo.png',
                    width: 200,
                    height: 200,
                  )),
              SizedBox(height: 50),
              Form(
                  child: Column(
                children: [
                  EditTextStyle(kNameTxt),
                  SizedBox(height: 30),
                  EditTextStyle(kPhoneNumberTxt),
                  SizedBox(height: 30),
                  EditTextStyle(kEmailTxt),
                  SizedBox(height: 30),
                  EditTextStyle(kPassword, isPassword: true),
                  SizedBox(height: 20),
                  Padding(
                      padding: EdgeInsets.fromLTRB(60, 16, 60, 16),
                      child: shadowButton(
                        name: kSignInText,
                        onPressed: () {
                          return Get.to(() => HomePage());
                        },
                      )),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
