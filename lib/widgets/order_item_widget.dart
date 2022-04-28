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
      height: 150,
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
            //  _launchURL(orderItem.goPath!);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// main info 2
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    orderItem.state!,
                    style: TextStyle(
                        fontFamily: 'Sukar',
                        fontSize: 30,
                        fontWeight: FontWeight.normal),
                  ),

                  MaterialButton(
                    height: 60,
                    child: Icon(
                      Icons.delete_forever_outlined,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// main type
                  Container(
                    width: 180,
                    child: ShadowButton(
                      name: orderItem.type!,
                      onPressed: () {},
                    ),
                  ),

                  /// main pic 2
                  Container(
                    width: 180,
                    child: ShadowButton(
                      name: " جنيه ${orderItem.price.toString()}",
                      onPressed: () {},
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
