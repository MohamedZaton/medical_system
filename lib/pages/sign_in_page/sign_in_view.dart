import 'package:developer/pages/home/home_view.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/colors.dart';
import '../../tools/constants.dart';
import '../../widgets/edit_text_widget.dart';
import '../../widgets/shadow_btn_widget.dart';
import '../sign_up_page/sigin_up_view.dart';
import 'sign_in_logic.dart';

class SignInPage extends StatelessWidget {
  static const String id = "/sign_in";

  final logic = Get.put(SignInLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Hero(
                tag: 'logo_splash',
                child: FluxImage(imageUrl: 'assets/logo/logo.png')),
            SizedBox(height: 50),
            Form(
                child: Column(
              children: [
                EditTextStyle(kPhoneNumberTxt),
                SizedBox(height: 30),
                EditTextStyle(kPassword),
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
            Padding(
                padding: EdgeInsets.fromLTRB(80, 16, 80, 16),
                child: shadowButton(
                    name: kSignUpText,
                    backgroundColor: kLightAccent,
                    onPressed: () {
                      return Get.to(() => SignUpPage());
                    })),
          ],
        ),
      ),
    );
  }
}
