import 'package:developer/models/depart_item_model.dart';
import 'package:developer/widgets/depart_item_widget.dart';
import 'package:get/get.dart';

import '../../services/app_api.dart';

class DepartmentLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <DepartItemWgt>[].obs;
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
      List<DepartItemModel> homeItems = await AppApi.fetchDepartmentsItems();
      int numPostion = 0;
      mainItemList.value = List<DepartItemWgt>.from(
        homeItems.map(
          (item) {
            numPostion++;
            return DepartItemWgt(
              homeItemModel: item,
              index: numPostion,
            );
          },
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
