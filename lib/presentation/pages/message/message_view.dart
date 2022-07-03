import 'package:developer/presentation/pages/home/home_view.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/screens.dart';
import '../../../../widgets/oval_btn_widget.dart';
import 'message_logic.dart';

class MessagePage extends StatelessWidget {
  final logic = Get.put(MessageLogic());
  static const String id = "/message_page";

  MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Submit"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FluxImage(
                imageUrl: "assets/icons/success.png",
                width: ScreenDevices.width(context) * 0.9,
                height: ScreenDevices.heigth(context) * 0.5,
              ),
              SizedBox(
                height: 6,
              ),
              OvalButtonWdgt(
                text: "رجوع للصفحة الرئيسية",
                isCenter: true,
                onPressed: () {
                  Get.to(() => HomePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
