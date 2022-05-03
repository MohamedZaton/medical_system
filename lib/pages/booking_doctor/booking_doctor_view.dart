import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booking_doctor_logic.dart';

class BookingDoctorPage extends StatelessWidget {
  final logic = Get.put(BookingDoctorLogic());
  static const String id = "/booking_doctor";

  BookingDoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Text(id),
    ));
  }
}
