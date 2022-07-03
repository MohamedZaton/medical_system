import 'package:developer/data/models/ads_model.dart' as listAds;
import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  var tabIndex = 4;
  List<listAds.Data> adsList = [];
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  void getAds() async {
    final response = await UserRepositoryImpl().getAdsUser();
    response.fold((l) {
      print("[getAds] error: " + l.message);
      return;
    }, (fetchlist) {
      adsList = fetchlist;
      update();
      return adsList;
    });
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAds();
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
