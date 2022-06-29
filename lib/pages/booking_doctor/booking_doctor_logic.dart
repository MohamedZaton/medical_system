import 'package:developer/models/booking_doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../tools/constants.dart';

class BookingDoctorLogic extends GetxController {
  RxBool isLoading = false.obs;
  Rx<BookingDoctorModel> selectedDoctorModel = BookingDoctorModel().obs;
  int bookingPage = 0;
  bool isHomeVisited = false;
  String selectedAddress = kSelectedAddressTxt;

  ///date
  bool isdaySelected = false;
  DateTime selectedDate = DateTime.now();
  String selectDayTitle = kSelectDay;

  ///time
  bool isTimeSelected = false;
  TimeOfDay selectedTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  String selectTimeTitle = kSelectTime;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  void selectHomePriceVisit({bool select = true}) {
    isHomeVisited = select;
    update();
  }

  void choseAddress(String address) {
    selectedAddress = address;
    update();
  }

  void selectDayVisit(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    selectedDate = date;
    isdaySelected = true;
    selectDayTitle = dateFormat.format(selectedDate);
    update();
  }

  void selectTimeVisit(TimeOfDay date) {
    selectedTime = date;
    isTimeSelected = true;
    selectTimeTitle = "${selectedTime.hour}:${selectedTime.minute}";
    update();
  }

  void nextPage({int page = 1}) {
    bookingPage = page;
    update();
  }

  void previousPage() {
    int p = bookingPage - 1;
    (p >= 0) ? bookingPage = p : bookingPage = 0;
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
