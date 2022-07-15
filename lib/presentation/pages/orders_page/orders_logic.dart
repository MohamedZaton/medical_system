import 'package:developer/data/models/reserv_model.dart' as reservList;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';
import '../../../tools/constants.dart';

class OrdersLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <reservList.Data>[].obs;
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
    isLoading.value = true;

    final response = await UserRepositoryImpl().getReservList();
    response.fold((l) {
      print("[getAds] error: " + l.message);
      isLoading.value = false;

      return;
    }, (fetchlist) {
      mainItemList.value.clear();
      mainItemList.value = fetchlist;
      isLoading.value = false;

      return;
    });
  }

  Future<void> cancelOrder(reservList.Data resevModel) async {
    final response =
        await UserRepositoryImpl().deletePutReservationOrder(resevModel.id!);
    response.fold((l) {
      Get.snackbar(kCancelTitleTxt, kCancelRejectedTxt,
          backgroundColor: Colors.amber);
      fetchList();
      return;
    }, (r) {
      Get.snackbar(kCancelTitleTxt, kCancelAcceptedTxt,
          backgroundColor: Colors.green);
      fetchList();

      return;
    });
  }
}
