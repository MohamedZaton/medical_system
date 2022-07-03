import 'package:developer/data/models/deliver_model.dart' as deliverList;
import 'package:developer/data/repositories/user_repository_impl.dart';
import 'package:get/get.dart';

class DeliveryLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <deliverList.Data>[].obs;
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
    final response = await UserRepositoryImpl().getDeliverList();
    int numPostion = 0;
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
