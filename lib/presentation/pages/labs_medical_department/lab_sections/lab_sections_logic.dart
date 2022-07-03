import 'package:get/get.dart';

import '../../medical_form/medical_form_view.dart';

class LabSectionsLogic extends GetxController {
  String chooseWayUploadOrList =
      MedicalFormPage.id; // or MedicalAnalysesListPage.id

  void selectedLabSection(String pageId) {
    chooseWayUploadOrList = pageId;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
