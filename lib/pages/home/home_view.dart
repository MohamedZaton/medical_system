import 'package:developer/pages/department_page/depart_view.dart';
import 'package:developer/pages/orders_page/orders_view.dart';
import 'package:developer/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/colors.dart';
import '../delivery_page/delivery_view.dart';
import '../setting_page/setting_view.dart';
import 'home_logic.dart';
import 'home_tab.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final logic = Get.put(HomeLogic());
  Widget tabItem(
      {required HomeLogic controller,
      required int index,
      required IconData icon}) {
    return GestureDetector(
      onTap: () {
        controller.changeTabIndex(index);
      },
      child: Container(
        width: 50,
        height: 90,
        alignment: Alignment.center,
        decoration: controller.tabIndex == index
            ? BoxDecoration(
                shape: index == 4 ? BoxShape.circle : BoxShape.rectangle,
                color: kDarkAccent)
            : BoxDecoration(),
        child: Icon(
          icon,
          color: controller.tabIndex == index ? Colors.white : kDarkAccent,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              OrdersPage(),
              DepartmentPage(),
              DeliveryPage(),
              SettingPage(),
              HomeTabWidget(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 50,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: shadowColorGlobal,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3.0)),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      tabItem(
                        controller: controller,
                        index: 0,
                        icon: Icons.wysiwyg_rounded,
                      ),
                      tabItem(
                        controller: controller,
                        index: 1,
                        icon: Icons.playlist_add_check_outlined,
                      ),
                      Container(width: 45, height: 45),
                      tabItem(
                        controller: controller,
                        index: 2,
                        icon: Icons.airport_shuttle_outlined,
                      ),
                      tabItem(
                        index: 3,
                        controller: controller,
                        icon: Icons.settings,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: ScreenDevices.width(context),
                height: 30,
                color: controller.tabIndex == 4 ? kCyanColor : Colors.white,
              ),
              Container(
                width: 70,
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                          color: shadowColorGlobal,
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(0, 3.0)),
                    ],
                  ),
                  child: tabItem(
                      controller: controller,
                      index: 4,
                      icon: Icons.home_outlined),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
