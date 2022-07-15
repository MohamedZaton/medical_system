import 'package:developer/data/models/register_model.dart';
import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:developer/presentation/pages/home/home_view.dart';
import 'package:developer/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpLogic extends GetxController {
  bool isLoading = false;

  void loadingWaitingRegister(bool loading) {
    isLoading = loading;
    update();
  }

  void createNewUser(RegisterModel registerModel) async {
    isLoading = true;
    final responce = await UserRepositoryImpl().createNewUser(registerModel);
    responce.fold((l) {
      //error
      Get.snackbar(kSignUpText, kSignUpFailedText, backgroundColor: Colors.red);
      isLoading = false;
      Get.offAll(() => HomePage());
      return;
    }, (r) {
      //success
      Get.snackbar(kSignUpText, kSignUpSuccessText,
          backgroundColor: Colors.green);

      isLoading = false;
      Get.offAll(() => HomePage());
      return;
    });
    update();
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
