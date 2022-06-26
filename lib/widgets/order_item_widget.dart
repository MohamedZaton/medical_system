import 'package:developer/models/order_model.dart';
import 'package:developer/tools/colors.dart';
import 'package:developer/widgets/shadow_btn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderItemWgt extends StatelessWidget {
  final OrderModel orderItem;
  final int index;
  const OrderItemWgt({
    Key? key,
    required this.orderItem,
    required this.index,
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
                  /// main info 2
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 150,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kStatueOrderColorsMap[orderItem.state!] ??
                            Colors.deepOrange,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        orderItem.state!,
                        style: TextStyle(
                          fontFamily: 'Sukar',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  Flexible(
                    flex: 1,
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// main type

                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 120,
                      child: ShadowButton(
                        name: orderItem.type!,
                        height: 30,
                        onPressed: () {},
                      ),
                    ),
                  ),

                  /// main pic 2
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 120,
                      child: ShadowButton(
                        height: 30,
                        name: " جنيه ${orderItem.price.toString()}",
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
