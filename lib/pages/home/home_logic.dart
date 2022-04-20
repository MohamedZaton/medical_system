import 'package:get/get.dart';

class HomeLogic extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
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
