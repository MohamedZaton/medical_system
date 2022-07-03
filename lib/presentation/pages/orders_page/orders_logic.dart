import 'package:developer/data/models/reserv_model.dart' as reservList;
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';

class OrdersLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <reservList.Data>[].obs;
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

    final response = await UserRepositoryImpl().getReservList();
    response.fold((l) {
      print("[getAds] error: " + l.message);
      isLoading.value = false;

      return;
    }, (fetchlist) {
      mainItemList.value = fetchlist;
      isLoading.value = false;

      return;
    });
  }
}
