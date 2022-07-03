import 'package:developer/core/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'depart_logic.dart';

class DepartmentPage extends StatelessWidget {
  final logic = Get.put(DepartmentLogic());
  static const String id = "/department";

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();
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
                } else {
                  return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: logic.mainItemList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenDevices.heigth(context) * 0.01),
                          child: logic.mainItemList[index],
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
