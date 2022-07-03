import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/screens.dart';
import '../../../../widgets/unber_constract_widget.dart';
import 'xray_list_logic.dart';

class XRayListPage extends StatelessWidget {
  final logic = Get.put(XRayListLogic());
  static const String id = "/xray_list_page";

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(logic.title.value),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //WebBarWidget(),

              Expanded(child: Obx(() {
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return (logic.mainItemList.length > 0)
                      ? Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: logic.mainItemList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenDevices.heigth(context) * 0.01),
                                child: logic.mainItemList[index],
                              );
                            },
                          ),
                        )
                      : UnderConstructionWidget();
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
