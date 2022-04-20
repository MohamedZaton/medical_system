import 'package:developer/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/depart_item_model.dart';
import 'flux_image.dart';

class DepartItemWgt extends StatelessWidget {
  final DepartItemModel homeItemModel;
  final int index;
  const DepartItemWgt({
    Key? key,
    required this.homeItemModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;

    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(12.0), boxShadow: [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(0, 1),
          blurRadius: 2.0,
        ),
      ]),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            _launchURL(homeItemModel.goPath!);
          },
          child: index.isOdd
              ? Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// main pic 1
                    Expanded(flex: 2, child: Pic(homeItemModel.iconPath!, ctx)),

                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: ScreenDevice.width(ctx) * 0.1,
                      ),
                    ),

                    /// main info 1
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: ScreenDevice.heigth(ctx) * 0.05),
                        child: Info(
                          homeItemModel: homeItemModel,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// main info 2
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: ScreenDevice.heigth(ctx) * 0.05,
                            left: ScreenDevice.width(ctx) * 0.05),
                        child: Info(
                          homeItemModel: homeItemModel,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: ScreenDevice.width(ctx) * 0.1,
                      ),
                    ),

                    /// main pic 2
                    Expanded(flex: 2, child: Pic(homeItemModel.iconPath!, ctx)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget Pic(String imagePath, BuildContext ctx) {
    return SizedBox(
      width: ScreenDevice.width(ctx) * 0.30,
      height: ScreenDevice.heigth(ctx) * 0.30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FluxImage(
          imageUrl: homeItemModel.iconPath!,
          fit: BoxFit.fitWidth,
          width: ScreenDevice.width(ctx) * 0.30,
          height: ScreenDevice.heigth(ctx) * 0.30,
        ),
      ),
    );
  }
}

_launchURL(String urlValue) async {
  String url = urlValue;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

/// info  App
class Info extends StatelessWidget {
  final DepartItemModel homeItemModel;

  Info({
    required this.homeItemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Wrap(
          children: [
            Text(
              homeItemModel.department!,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ],
    );
  }
}

/// tech icons
