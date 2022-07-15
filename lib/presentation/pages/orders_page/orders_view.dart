import 'package:developer/core/utils/images_path.dart';
import 'package:developer/tools/constants.dart';
import 'package:developer/widgets/message_img_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/screens.dart';
import '../../../widgets/order_item_widget.dart';
import 'orders_logic.dart';

class OrdersPage extends StatelessWidget {
  static const String id = "/order";

  final logic = Get.put(OrdersLogic());
  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    alignment: Alignment.center,
                    height: ScreenDevices.heigth(context),
                    width: ScreenDevices.width(context),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: logic.mainItemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenDevices.heigth(context) * 0.01),
                          child: OrderItemWgt(
                            orderItem: logic.mainItemList[index],
                            index: index,
                            onPress: () {
                              logic.cancelOrder(logic.mainItemList[index]);
                              logic.fetchList();
                            },
                          ), // ,
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
