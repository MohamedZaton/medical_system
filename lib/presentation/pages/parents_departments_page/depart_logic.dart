import 'package:developer/data/models/category_model.dart' as categoryList;
import 'package:developer/tools/api_keys.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../../../data/services/server_app_api.dart';

class DepartmentLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList<categoryList.Data> mainItemList = <categoryList.Data>[].obs;
  RxInt? idGo = 0.obs;
  RxInt? idParentBack = 0.obs;
  RxString typeGo = kParentFlowValue.obs;
  RxBool isFlowTypeKey = false.obs;

  @override
  void onReady() {
    ///implement onReady
    fetchParentList();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<bool> checkIsFlowType(int? id) async {
    final response = await ServerAppApi().getSubDepartmentRequest(id!);
    String responseStr = response.toString();
    isFlowTypeKey.value = responseStr.toString().contains(kFlowTypeParamKey);
    print("isFlowTypeKey= ${isFlowTypeKey.value}");
    return isFlowTypeKey.value;
  }

  void fetchParentList() async {
    idGo?.value = -1;
    isLoading.value = true;
    print("[fetch_ParentList] sub id: idGo?.value");

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

  void fetchSubList(int? id) async {
    print("[fetch_SubList] sub id: $id");
    if (id == -1 || id == null) {
      fetchParentList();
      return;
    }
    isLoading.value = true;
    final response = await UserRepositoryImpl().getSubCtgList(id);
    response.fold((l) {
      print("[getDepartment] error: " + l.message);
      isLoading.value = false;
    }, (fetchlist) {
      mainItemList.value = fetchlist;
      isLoading.value = false;

      return;
    });
  }
}
