import 'package:developer/core/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import '../../../widgets/parent_depart_widget.dart';
import 'depart_logic.dart';

class DepartmentPage extends StatelessWidget {
  final logic = Get.put(DepartmentLogic());
  static const String id = "/department";

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
                          message: kNoParentDepTxt, imageUrl: kOrderBoxImg));
                } else {
                  return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: logic.mainItemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenDevices.heigth(context) * 0.01),
                          child: ParentDpItemWgt(
                            homeItemModel: logic.mainItemList[index],
                            onPressed: () {},
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
