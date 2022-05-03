import 'package:developer/tools/api_keys.dart';
import 'package:get/get.dart';

import '../../../models/depart_item_model.dart';
import '../../../services/local_app_api.dart';
import '../../../widgets/depart_item_widget.dart';

class HospitalsListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <DepartItemWgt>[].obs;
  RxString title = kHospitalsTitleKey.obs;

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

      List<DepartItemModel> homeItems = await LocalAppApi()
          .fetchSubDepartItems(fileName: kDepartmentsApi[title.value]!);
      int numPostion = -1;
      mainItemList.value = List<DepartItemWgt>.from(
        homeItems.map(
          (item) {
            numPostion++;
            return DepartItemWgt(
              homeItemModel: item,
              index: numPostion,
              onPressed: () {},
            );
          },
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
