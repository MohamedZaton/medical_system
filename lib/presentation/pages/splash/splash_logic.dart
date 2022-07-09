import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:developer/data/services/local_data.dart';
import 'package:get/get.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    checkToken();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}

Future<void> checkToken() async {
  print("[splash_logic] checkToken AAA ");
  if (await LocalData().readAcceptAutoLogin()) {
    await UserRepositoryImpl().refreshToken();
  }
}
