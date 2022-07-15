import 'package:developer/data/models/services_list_model.dart' as servicesList;
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../../../tools/api_keys.dart';

class ServicesListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList<servicesList.Data> serviceItemsList = <servicesList.Data>[].obs;
  RxString title = kServicesListKey.obs;
  RxInt? idGo = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ///implement onReady

    super.onReady();
    fetchServicesList();
  }

  @override
  void onClose() {
    super.onClose();
    serviceItemsList.value.clear();
  }

  void fetchServicesList() async {
    print("[ServicesListLogic ][fetchServicesList] sub id: ${idGo?.value}");

    isLoading.value = true;
    final response = await UserRepositoryImpl().getServicesList(idGo?.value);
    response.fold((l) {
      print("[ServicesListLogic] error: " + l.message);
      isLoading.value = false;
    }, (fetchList) {
      serviceItemsList.value = fetchList;
      isLoading.value = false;

      return;
    });
  }
}
