import 'package:developer/core/utils/screens.dart';
import 'package:developer/data/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/edit_text_widget.dart';
import '../../../../widgets/flux_image.dart';
import '../../../../widgets/shadow_btn_widget.dart';
import '../../../tools/constants.dart';
import 'sigin_up_logic.dart';

class SignUpPage extends StatelessWidget {
  static const String id = "/sign_up";

  final logic = Get.put(SignUpLogic());
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // declare a GlobalKey
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SignUpLogic>(builder: (controller) {
          return Container(
            alignment: Alignment.center,
            width: ScreenDevices.width(context),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
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
                      key: _formKey,
                      child: Column(
                        children: [
                          EditTextStyle(
                            kNameTxt,
                            controller: nameController,
                          ),
                          SizedBox(height: 30),
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
                          Padding(
                              padding: EdgeInsets.fromLTRB(60, 16, 60, 16),
                              child: ShadowButton(
                                name: kSignInText,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    controller.createNewUser(
                                      RegisterModel(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          password: passwordController.text),
                                    );

                                    //return Get.to(() => HomePage());
                                  }
                                },
                              )),
                        ],
                      )),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
