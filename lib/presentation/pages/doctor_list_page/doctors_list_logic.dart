import 'package:developer/data/models/booking_doctor_model.dart';
import 'package:get/get.dart';

import '../../../../data/services/local_app_api.dart';
import '../../../tools/api_keys.dart';

class DoctorsListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList<BookingDoctorModel> mainItemList = <BookingDoctorModel>[].obs;
  RxString title = kClinicsTitleKey.obs;

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

      mainItemList.value = await LocalAppApi().fetchDoctorBookingItems();
    } finally {
      isLoading.value = false;
    }
  }
}
