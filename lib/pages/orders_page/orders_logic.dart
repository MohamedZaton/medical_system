import 'package:developer/models/order_model.dart';
import 'package:developer/widgets/order_item_widget.dart';
import 'package:get/get.dart';

import '../../services/local_app_api.dart';

class OrdersLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <OrderItemWgt>[].obs;
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
      List<OrderModel> homeItems = await LocalAppApi().fetchOrdersItems();
      int numPostion = 0;
      mainItemList.value = List<OrderItemWgt>.from(
        homeItems.map(
          (item) {
            numPostion++;
            return OrderItemWgt(
              index: numPostion,
              orderItem: item,
            );
          },
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
