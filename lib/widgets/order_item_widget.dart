import 'package:developer/data/models/reserv_model.dart' as reservList;
import 'package:developer/tools/colors.dart';
import 'package:developer/widgets/shadow_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum Status { PENDING, INPROGRESS, REJECTED, COMPLETED, CANCELED }

class OrderItemWgt extends StatelessWidget {
  final reservList.Data orderItem;
  final int index;
  final Function() onPress;
  const OrderItemWgt({
    Key? key,
    required this.orderItem,
    required this.index,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;

    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 1),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        color: kDarkAccent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            //  _launchURL(orderItem.goPath!);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// status name
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 150,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kStatueRevColorsMap[orderItem.status] ??
                            Colors.deepOrange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        orderItem.status ?? "nullx",
                        style: TextStyle(
                          fontFamily: 'Sukar',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  /// delete button cancel
                  if (orderItem.status != Status.CANCELED.name) ...[
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        onTap: onPress,
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// type order name

                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 120,
                      child: ShadowButton(
                        name: orderItem.serviceName.toString(),
                        height: 30,
                        onPressed: () {},
                      ),
                    ),
                  ),

                  /// price
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 120,
                      child: ShadowButton(
                        height: 30,
                        name: " جنيه ${orderItem.totalPrice.toString()}",
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, Color> kStatueRevColorsMap = {
  Status.COMPLETED.name: Colors.green,
  Status.PENDING.name: Colors.blueGrey,
  Status.INPROGRESS.name: Colors.blueGrey,
  Status.CANCELED.name: Colors.red,
  Status.REJECTED.name: Colors.red,
};
