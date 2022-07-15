import 'package:developer/data/models/ads_model.dart' as listAds;
import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

import '../delivery_page/delivery_logic.dart';
import '../orders_page/orders_logic.dart';
import '../parents_departments_page/depart_logic.dart';
import '../setting_page/setting_logic.dart';

class HomeLogic extends GetxController {
  var tabIndex = 4;
  RxList<listAds.Data> adsList = <listAds.Data>[].obs;

  void changeTabIndex(int index) {
    tabIndex = index;
    final orderLogic = Get.find<OrdersLogic>();
    final departmentLogic = Get.find<DepartmentLogic>();
    final deliveryLogic = Get.find<DeliveryLogic>();
    final settingLogic = Get.find<SettingLogic>();
    switch (index) {
      case 0:
        {
          orderLogic.fetchList();
          break;
        }
      case 1:
        {
          departmentLogic.fetchParentList();
          break;
        }
      case 2:
        {
          deliveryLogic.fetchList();
          break;
        }
      case 3:
        {
          settingLogic.getwhatsappNumbers();
          settingLogic.getFacebookPage();
          break;
        }
      case 4:
        {
          getAds();
          break;
        }
    }
    update();
  }

  void getAds() async {
    final response = await UserRepositoryImpl().getAdsUser();
    response.fold((l) {
      print("[getAds] error: " + l.message);
      return;
    }, (fetchlist) {
      adsList.value = fetchlist;
      return adsList.value;
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
    //NetworkStatusService();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
