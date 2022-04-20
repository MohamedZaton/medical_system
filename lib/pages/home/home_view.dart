import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/colors.dart';
import '../../widgets/flux_image.dart';
import 'home_logic.dart';

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
        width: 45,
        height: 45,
        alignment: Alignment.center,
        decoration: controller.tabIndex == index
            ? BoxDecoration(
                shape: index == 5 ? BoxShape.circle : BoxShape.rectangle,
                color: kDarkAccent)
            : BoxDecoration(),
        child: Icon(
          icon,
          color: controller.tabIndex == index ? Colors.white : kDarkAccent,
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
          child: Container(
            color: kCyanColor,
            alignment: Alignment.center,
            child: FluxImage(imageUrl: 'assets/logo/logo_home.png'),
          ),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 70,
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
                        index: 1,
                        icon: Icons.person_outline_rounded),
                    tabItem(
                        controller: controller,
                        index: 2,
                        icon: Icons.playlist_add_check_outlined),
                    Container(width: 45, height: 45),
                    tabItem(
                        controller: controller,
                        index: 3,
                        icon: Icons.airport_shuttle_outlined),
                    tabItem(
                        controller: controller, index: 4, icon: Icons.settings),
                  ],
                ),
              ),
            ),
            Container(
              width: 45,
              height: 45,
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {
                  controller.changeTabIndex(5);
                },
                child: tabItem(
                    controller: controller,
                    index: 5,
                    icon: Icons.home_outlined),
              ),
            )
          ],
        ),
      );
    });
  }
}
