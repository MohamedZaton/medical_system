import 'package:developer/pages/medical_form/medical_form_view.dart';
import 'package:developer/tools/api_keys.dart';
import 'package:get/get.dart';

import '../../../models/depart_item_model.dart';
import '../../../services/local_app_api.dart';
import '../../../widgets/depart_item_widget.dart';

class PharmaciesListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <DepartItemWgt>[].obs;
  RxString title = kPharmacyTitleKey.obs;

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
              onPressed: () {
                Get.to(MedicalFormPage(
                  pharmacyLogo: item.iconPath.toString(),
                  pharmacyTitle: item.department.toString(),
                ));
              },
            );
          },
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
