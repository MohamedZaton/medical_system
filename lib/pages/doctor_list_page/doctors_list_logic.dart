import 'package:developer/models/booking_doctor_model.dart';
import 'package:developer/widgets/doctor_item_widget.dart';
import 'package:get/get.dart';

import '../../services/local_app_api.dart';
import '../../tools/api_keys.dart';
import '../booking_doctor/booking_doctor_view.dart';

class DoctorsListLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <DoctorItemWgt>[].obs;
  RxString title = kClinicsTitleKey.obs;

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

      List<BookingDoctorModel> homeItems =
          await LocalAppApi().fetchDoctorBookingItems();
      int numPostion = -1;
      mainItemList.value = List<DoctorItemWgt>.from(
        homeItems.map(
          (item) {
            numPostion++;
            return DoctorItemWgt(
              doctorItemModel: item,
              index: numPostion,
              initialRating: 3.0,
              onPressed: () {
                Get.to(() => BookingDoctorPage(
                      doctorInfoModel: item,
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
