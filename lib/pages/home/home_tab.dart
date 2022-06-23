import 'package:carousel_slider/carousel_slider.dart';
import 'package:developer/tools/constants.dart';
import 'package:developer/utils/screens.dart';
import 'package:flutter/material.dart';

import '../../tools/colors.dart';
import '../../utils/images_path.dart';
import '../../widgets/flux_image.dart';

class HomeTabWidget extends StatelessWidget {
  const HomeTabWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kCyanColor,
          alignment: Alignment.bottomCenter,
          child: FluxImage(
            imageUrl: kHomeIcon,
            width: 400,
            height: 400,
          ),
        ),
        Container(
            width: ScreenDevice.width(context),
            height: 150,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 2),
                viewportFraction: 1,
                aspectRatio: 1,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              items: [
                AdsSpaceWidget(),
                AdsSpaceWidget(
                  backgroundColor: Colors.blue,
                ),
                AdsSpaceWidget(
                  backgroundColor: Colors.green,
                ),
              ],
            ))
      ],
    );
  }
}

class AdsSpaceWidget extends StatelessWidget {
  final Color? backgroundColor;
  const AdsSpaceWidget({
    Key? key,
    this.backgroundColor = kSubTextColor,
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
                Text(
                  kAdsSpaceTxt,
                  style: TextStyle(
                      fontFamily: 'Sukar',
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
