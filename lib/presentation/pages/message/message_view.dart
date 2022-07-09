import 'package:developer/core/utils/images_path.dart';
import 'package:developer/presentation/pages/home/home_view.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/oval_btn_widget.dart';
import '../../../core/utils/screens.dart';
import 'message_logic.dart';

class MessagePage extends StatelessWidget {
  final logic = Get.put(MessageLogic());
  static const String id = "/message_page";
  final String? imagePath;
  final String? message;
  final String? nameButton;
  final Function()? onPressed;

  MessagePage(
      {Key? key, this.imagePath, this.message, this.nameButton, this.onPressed})
      : super(key: key);

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
                imageUrl: imagePath ?? kSuccessImg,
                width: ScreenDevices.width(context) * 0.9,
                height: ScreenDevices.heigth(context) * 0.5,
              ),
              SizedBox(
                height: 6,
              ),
              if (message != null) ...[
                Text(
                  "",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 6,
                ),
              ],
              OvalButtonWdgt(
                text: nameButton ?? "رجوع للصفحة الرئيسية",
                isCenter: true,
                onPressed: onPressed ??
                    () {
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
