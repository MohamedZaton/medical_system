import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'medical_form_logic.dart';

class MedicalFormPage extends StatelessWidget {
  final logic = Get.put(MedicalFormLogic());
  static const String id = "/medical_form";

  MedicalFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Text(id),
    ));
  }
}
