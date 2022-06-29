import 'package:developer/models/division_model.dart';
import 'package:get/get.dart';

import '../../tools/api_keys.dart';

class DivisionsLogic extends GetxController {
  RxString title = kDivisionTitleKey.obs;
  RxList<DivisionModel> itemTypeList = <DivisionModel>[].obs;
  RxInt selectedIndex = 0.obs;

  List<DivisionModel> getItemTypeList() {
    return itemTypeList.value;
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
