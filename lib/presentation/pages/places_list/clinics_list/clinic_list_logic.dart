import 'package:developer/tools/api_keys.dart';
import 'package:get/get.dart';

import '../../../../data/models/depart_item_model.dart';
import '../../../../data/services/local_app_api.dart';

class ClinicsListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList<DepartItemModel> mainItemList = <DepartItemModel>[].obs;
  RxString title = kServicesListKey.obs;

  @override
  void onReady() {
    ///implement onReady
    fetchList();

    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    super.onClose();
  }

  void fetchList() async {
    try {
      isLoading.value = true;

      mainItemList.value = await LocalAppApi()
          .fetchSubDepartItems(fileName: kDepartmentsApi[title.value]!);
    } finally {
      isLoading.value = false;
    }
  }
}
