import 'package:developer/models/analyses_model.dart';
import 'package:get/get.dart';

import '../../../services/local_app_api.dart';
import '../../../tools/constants.dart';

class MedicalAnalysesListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList<AnalysesModel> mainItemList = <AnalysesModel>[].obs;
  RxString title = kAnalysesTitleTxt.obs;
  @override
  void onReady() {
    ///implement onReady
    fetchList();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchList() async {
    try {
      isLoading.value = true;

      mainItemList.value = await LocalAppApi().fetchAnalysesItems();
    } finally {
      isLoading.value = false;
    }
  }
}
