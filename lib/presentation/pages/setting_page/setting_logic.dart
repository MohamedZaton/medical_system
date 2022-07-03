import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:developer/data/services/server_app_api.dart';
import 'package:developer/presentation/pages/splash/splash_view.dart';
import 'package:get/get.dart';

class SettingLogic extends GetxController {
  String facebookPage = "";

  @override
  void onInit() {
    super.onInit();
    getFacebookPage();
    getwhatsappPage();
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

  void getFacebookPage() async {
    final responce = await ServerAppApi().getFacebookPageRequest();

    facebookPage = "https://" + responce.toString();
  }

  void getwhatsappPage() async {
    final responce = await ServerAppApi().getWhatsAppNumbersRequest();
  }

  void signOutProcess() async {
    final responce = await UserRepositoryImpl().logOutUser();
    responce.fold(
      (l) => Get.to(() => SplashPage()),
      (r) => Get.to(() => SplashPage()),
    );
  }
}
