import 'package:developer/models/delivery_model.dart';
import 'package:get/get.dart';

import '../../services/local_app_api.dart';
import '../../widgets/delivery_item_widget.dart';

class DeliveryLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <DeliveryWgt>[].obs;
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
      List<DeliveryModel> homeItems =
          await LocalAppApi().fetchDeliveriesItems();
      int numPostion = 0;
      mainItemList.value = List<DeliveryWgt>.from(
        homeItems.map(
          (item) {
            numPostion++;
            return DeliveryWgt(
              deliveryModel: item,
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
