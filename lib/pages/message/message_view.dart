import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FluxImage(imageUrl: "assets/icons/success.png"),
            ],
          ),
        ),
      ),
    );
  }
}
