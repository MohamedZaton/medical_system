import 'package:developer/widgets/delivery_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import 'delivery_logic.dart';

class DeliveryPage extends StatelessWidget {
  final logic = Get.put(DeliveryLogic());
  static const String id = "/delivery";

  @override
  build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //WebBarWidget(),
              Expanded(child: Obx(() {
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (logic.isLoading.value == false &&
                    logic.mainItemList.length <= 0) {
                  return Center(
                      child: MessageImgButtonWdgt(
                          title: kOrderYetTxt, imageUrl: kOrderBoxImg));
                } else {
                  return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: logic.mainItemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenDevices.heigth(context) * 0.01),
                          child: DeliveryWgt(
                            deliveryModel: logic.mainItemList[index],
                            index: index,
                          ),
                        );
                      },
                    ),
                  );
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
