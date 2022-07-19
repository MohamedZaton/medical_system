import 'dart:io';

import 'package:developer/data/models/service_details_model.dart'
    as serviceDetails;
import 'package:developer/presentation/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/images_path.dart';
import '../../../data/models/upload_model.dart';
import '../../../data/repositories/user_repository_impl.dart';
import '../../../tools/colors.dart';
import '../../../tools/constants.dart';
import '../home/home_view.dart';
import '../message/message_view.dart';
import '../services_list_page/services_list_logic.dart';

class BookingDoctorLogic extends GetxController {
  RxBool isLoading = false.obs;
  Rx<serviceDetails.Data> detailsModel = serviceDetails.Data().obs;
  RxInt bookingPage = 0.obs;
  String selectedAddress = kSelectedAddressTxt;
  RxInt? idGo = 0.obs;
  Rx<UploadModel?> uploadModel = UploadModel().obs;
  RxBool isUploaded = false.obs;
  final servListLogic = Get.find<ServicesListLogic>();

  ///date
  RxBool isdaySelected = false.obs;
  DateTime selectedDate = DateTime.now();
  String selectDayTitle = kSelectDay;

  ///time
  RxBool isTimeSelected = false.obs;
  TimeOfDay selectedTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  String selectTimeTitle = kSelectTime;

  void setUploadModel(UploadModel uploadModelV) {
    uploadModel.value = uploadModelV;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    fetchServicesDetails();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void choseAddress(String address) {
    selectedAddress = address;
    update();
  }

  void selectDayVisit(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    selectedDate = date;
    isdaySelected.value = true;
    selectDayTitle = dateFormat.format(selectedDate);
    update();
  }

  void selectTimeVisit(TimeOfDay date) {
    selectedTime = date;
    isTimeSelected.value = true;
    selectTimeTitle = "${selectedTime.hour}:${selectedTime.minute}";
    update();
  }

  void nextPage({int page = 1}) {
    bookingPage.value = page;
  }

  void previousPage() {
    int p = bookingPage.value - 1;
    (p >= 0) ? bookingPage.value = p : bookingPage.value = 0;
    update();
  }

  void fetchServicesDetails() async {
    int? oldId = servListLogic.idGo?.value;
    if (oldId != null) {
      idGo?.value = oldId;
    }
    print("[BookingDoctorLogic ][fetchServicesDetails] sub id: ${idGo?.value}");

    isLoading.value = true;
    final response = await UserRepositoryImpl().getServiceDetails(idGo?.value);
    response.fold((l) {
      print("[BookingDoctorLogic] error: " + l.message);
      isLoading.value = false;
    }, (fetchList) {
      detailsModel.value = fetchList;
      isLoading.value = false;

      return;
    });
  }

  Future<void> sendBookingPaper() async {
    print("start send booking  doctor ");
    File image = new File('');
    uploadModel.value = UploadModel(
      reservationDate: selectDayTitle,
      reservationTime: selectTimeTitle,
      serviceProviderId: detailsModel.value.serviceProviderId.toString(),
      zoneId: "1",
      serviceId: detailsModel.value.id.toString(),
    );
    final response = await UserRepositoryImpl()
        .createReservationPaper(uploadModel.value!, image, hasImage: false);
    response.fold((failure) {
      Get.snackbar("Failed Upload", failure.message,
          backgroundColor: kDarkAccent);
      print("Failed Upload ${failure.message}");
      Get.to(MessagePage(
        imagePath: kFailedImg,
        message: kUploadFaildTxt,
        nameButton: kBackTxt,
        onPressed: () {
          Get.to(HomePage());
        },
      ));

      return;
    }, (isSuccess) {
      isUploaded.value = isSuccess;
      Get.snackbar("state upload", "$isUploaded");
      print("state upload $isUploaded");

      update();
      Get.to(MessagePage(
        imagePath: kSuccessImg,
        message: kUploadSuccessTxt,
        nameButton: kBackTxt,
        onPressed: () {
          Get.offAll(SplashPage());
        },
      ));
      return;
    });
  }
}
