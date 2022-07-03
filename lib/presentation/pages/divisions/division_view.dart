import 'package:developer/tools/constants.dart';
import 'package:developer/widgets/title_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/screens.dart';
import 'divisions_logic.dart';

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

class DivisionsPage extends StatelessWidget {
  final logic = Get.put(DivisionsLogic());
  static const String id = "/divisions";

  @override
  Widget build(BuildContext context) {
    List<Widget> typeItems = (logic.getItemTypeList() != 0)
        ? logic.getItemTypeList().mapIndexed(
            (item, index) {
              return Column(
                children: [
                  TitleButtonWidget(
                      title: item.title.toString(),
                      onPressed: () {
                        logic.selectedIndex.value = index;
                        print("select index ${logic.selectedIndex.value}");
                        Get.to(() => item.pageWidgetPath);
                      }),
                  SizedBox(
                    height: 6,
                  )
                ],
              );
            },
          ).toList()
        : [
            Text(kEmptyTxt),
          ];
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            logic.title.value,
          ),
          centerTitle: true,
        ),
        body: Container(
          width: ScreenDevices.width(context),
          height: ScreenDevices.heigth(context) * 0.80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(height: 50),
              Column(
                children: typeItems,
              ),
            ],
          ),
        ),
      );
    });
  }
}
