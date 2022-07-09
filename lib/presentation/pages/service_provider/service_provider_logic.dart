import 'package:developer/data/models/service_pdr_model.dart' as servicePdrList;
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../../../tools/api_keys.dart';

class ServiceProviderLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList<servicePdrList.Data> servicePrItemList = <servicePdrList.Data>[].obs;
  RxInt? idGo = 0.obs;

  RxString typeGo = kParentFlowValue.obs;
  RxBool isFlowTypeKey = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ///implement onReady
    super.onReady();
    fetchServerProviderList();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void fetchServerProviderList() async {
    print("[ServiceProviderLogic ][fetch_SubList] sub id: ${idGo?.value}");

    isLoading.value = true;
    final response =
        await UserRepositoryImpl().getServiceProviderList(idGo?.value);
    response.fold((l) {
      print("[getDepartment] error: " + l.message);
      isLoading.value = false;
    }, (fetchlist) {
      servicePrItemList.value = fetchlist;
      isLoading.value = false;

      return;
    });
  }
}
