import 'package:developer/data/models/parent_categ_model.dart' as parentList;
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';

class DepartmentLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <parentList.Data>[].obs;
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
    isLoading.value = true;
    final response = await UserRepositoryImpl().getParentCtgList();
    response.fold((l) {
      print("[getAds] error: " + l.message);
      isLoading.value = false;
    }, (fetchlist) {
      mainItemList.value = fetchlist;
      isLoading.value = false;

      return;
    });
  }
}
