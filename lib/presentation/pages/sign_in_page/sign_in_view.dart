import 'package:developer/core/utils/screens.dart';
import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/edit_text_widget.dart';
import '../../../../widgets/shadow_btn_widget.dart';
import '../../../tools/colors.dart';
import '../../../tools/constants.dart';
import '../sign_up_page/sigin_up_view.dart';
import 'sign_in_logic.dart';

class SignInPage extends StatelessWidget {
  static const String id = "/sign_in";

  final logic = Get.put(SignInLogic());
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // declare a GlobalKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignInLogic>(builder: (controller) {
        return Container(
          alignment: Alignment.center,
          height: ScreenDevices.heigth(context),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                SizedBox(height: 5),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      EditTextStyle(
                        kPhoneNumberTxt,
                        textInputType: TextInputType.phone,
                        controller: phoneController,
                      ),
                      SizedBox(height: 30),
                      EditTextStyle(
                        kPassword,
                        isPassword: true,
                        controller: passwordController,
                      ),
                      SizedBox(height: 20),
                      if (!controller.isLoading) ...[
                        Padding(
                            padding: EdgeInsets.fromLTRB(60, 16, 60, 16),
                            child: ShadowButton(
                              name: kSignInText,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.loginUser(
                                    LogInModel(
                                        phone: phoneController.text,
                                        password: passwordController.text),
                                  );
                                }
                              },
                            )),
                      ] else ...[
                        Padding(
                            padding: EdgeInsets.fromLTRB(60, 16, 60, 16),
                            child: Container(
                              child:
                                  CircularProgressIndicator(color: kDarkAccent),
                            )),
                      ],
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(80, 16, 80, 16),
                    child: ShadowButton(
                        name: kSignUpText,
                        backgroundColor: kLightAccent,
                        onPressed: () {
                          return Get.to(() => SignUpPage());
                        })),
              ],
            ),
          ),
        );
      }),
    );
  }
}
