import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:developer/data/services/server_app_api.dart';
import 'package:developer/presentation/pages/splash/splash_view.dart';
import 'package:get/get.dart';

class SettingLogic extends GetxController {
  String facebookPage = "";
  List<String> numbersWatsappList = [];
  String aboutText =
      "تطبيق WeCare Matrooh هو تطبيق خاص بأهل مطروح يهتم بكل النواحى الطبيه مثل الأشعه والتحاليل والعيادات والصيدليات";
  @override
  void onInit() {
    super.onInit();
    getFacebookPage();
    getwhatsappNumbers();
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
    update();
  }

  void getwhatsappNumbers() async {
    final responce = await ServerAppApi().getWhatsAppNumbersRequest();
    String numbersText = responce.data.toString();
    numbersWatsappList =
        numbersText.substring(1, numbersText.length - 1).split(',');
    print("numbersWatsappList 0 :${numbersWatsappList[0].toString()}");
    update();
  }

  void getAboutParagraph() async {
    final responce = await ServerAppApi().getWhatsAppNumbersRequest();

    print("getAboutParagraph  :${responce.data.toString()}");
    aboutText = responce.data.toString();
    update();
  }

  void signOutProcess() async {
    final responce = await UserRepositoryImpl().logOutUser();
    responce.fold(
      (l) => Get.to(() => SplashPage()),
      (r) => Get.to(() => SplashPage()),
    );
  }
}
