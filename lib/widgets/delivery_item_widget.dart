import 'package:developer/models/delivery_model.dart';
import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeliveryWgt extends StatelessWidget {
  final DeliveryModel deliveryModel;
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
                        //launch("tel://${deliveryModel.phone}");
                      }),
                ),

                /// main info 2
                Spacer(),
                Expanded(
                  flex: 1,
                  child: FittedBox(
                    child: Text(
                      deliveryModel.name!,
                      style: TextStyle(
                          fontFamily: 'Sukar',
                          fontSize: 30,
                          fontWeight: FontWeight.normal),
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
