import 'package:developer/data/models/deliver_model.dart' as deliverList;
import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryWgt extends StatelessWidget {
  final deliverList.Data deliveryModel;
  final int index;
  const DeliveryWgt({
    Key? key,
    required this.deliveryModel,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;

    return Container(
      width: 100,
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
        color: kDarkAccent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            //  _launchURL(homeItemModel.goPath!);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: FloatingActionButton(
                      heroTag: "delivery_item_call" + index.toString(),
                      child: Icon(
                        Icons.call,
                        color: kDarkAccent,
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse("tel:${deliveryModel.phone}"));
                      }),
                ),

                /// main info 2
                Spacer(),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Column(
                      children: [
                        Text(
                          deliveryModel.name!,
                          style: TextStyle(
                              fontFamily: 'Sukar',
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          deliveryModel.zoneName!,
                          style: TextStyle(
                              fontFamily: 'Sukar',
                              fontSize: 10,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
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
