import 'package:carousel_slider/carousel_slider.dart';
import 'package:developer/presentation/pages/home/home_logic.dart';
import 'package:developer/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/flux_image.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/colors.dart';

class HomeTabWidget extends StatelessWidget {
  final logic = Get.put(HomeLogic());

  HomeTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kCyanHomeColor,
          alignment: Alignment.bottomCenter,
          child: FluxImage(
            imageUrl: kHomeIcon,
            width: 400,
            height: 400,
          ),
        ),
        Obx(() {
          return (logic.adsList.length > 0)
              ? AdsListWidget(
                  itemList: logic.adsList.map((item) {
                    return Builder(
                      builder: (context) {
                        return AdsSpaceWidget(
                          adsImagePath: item.image.toString(),
                        );
                      },
                    );
                  }).toList(),
                )
              : AdsListWidget(
                  itemList: [
                    AdsSpaceWidget(),
                    AdsSpaceWidget(
                      backgroundColor: Colors.blue,
                    ),
                    AdsSpaceWidget(
                      backgroundColor: Colors.green,
                    ),
                  ],
                );
        }),
      ],
    );
  }
}

class AdsListWidget extends StatelessWidget {
  List<Widget> itemList;

  AdsListWidget({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      child: Container(
          width: ScreenDevices.width(context),
          color: kCyanHomeColor,
          height: 160,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              viewportFraction: 1,
              aspectRatio: 1,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: itemList,
          )),
    );
  }
}

class AdsSpaceWidget extends StatelessWidget {
  final Color? backgroundColor;
  final String? adsImagePath;

  const AdsSpaceWidget({
    Key? key,
    this.backgroundColor = kDarkAccent,
    this.adsImagePath = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 1),
                blurRadius: 2.0,
              ),
            ]),
        child: Material(
          borderRadius: BorderRadius.circular(12.0),
          color: backgroundColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              //  _launchURL(homeItemModel.goPath!);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// main info 2
                SizedBox(
                  width: 20,
                ),
                FittedBox(
                  child: (adsImagePath != "")
                      ? FluxImage(
                          imageUrl: adsImagePath.toString(),
                          fit: BoxFit.fill,
                          height: 150,
                          width: 300,
                        )
                      : Text(
                          kAdsSpaceTxt,
                          style: TextStyle(
                              fontFamily: 'Sukar',
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
