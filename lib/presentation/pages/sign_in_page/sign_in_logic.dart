import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../home/home_view.dart';

class SignInLogic extends GetxController {
  bool isLoading = false;

  void loadingWaitingSignIn(bool loading) {
    isLoading = loading;
    update();
  }

  void loginUser(LogInModel logInModel) async {
    isLoading = true;
    final responce = await UserRepositoryImpl().loginUser(logInModel);
    responce.fold((f) {
      //error
      Get.snackbar(kSignInText, f.message, backgroundColor: Colors.red);
      isLoading = false;

      return;
    }, (r) {
      //success
      Get.snackbar(kSignUpText, kSignUpSuccessText,
          backgroundColor: Colors.green);
      isLoading = false;
      getInfoUser();
      return Get.offAll(() => HomePage());
    });
    update();
  }

  void getInfoUser() async {
    await UserRepositoryImpl().profileInfoUser();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
