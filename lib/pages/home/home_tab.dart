import 'package:developer/tools/constants.dart';
import 'package:flutter/material.dart';

import '../../tools/colors.dart';
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
          alignment: Alignment.center,
          child: FluxImage(imageUrl: 'assets/logo/logo_home.png'),
        ),
        AdsSpaceWidget(),
      ],
    );
  }
}

class AdsSpaceWidget extends StatelessWidget {
  const AdsSpaceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
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
          color: kSubTextColor,
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
