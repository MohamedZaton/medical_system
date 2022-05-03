import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/depart_item_model.dart';
import 'flux_image.dart';

class DepartItemWgt extends StatelessWidget {
  final DepartItemModel homeItemModel;
  final int index;
  final Function()? onPressed;
  const DepartItemWgt({
    Key? key,
    required this.homeItemModel,
    required this.index,
    required this.onPressed,
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
        color: kDarkAccent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// main info 2
              SizedBox(
                width: 20,
              ),
              Text(
                homeItemModel.department!,
                style: TextStyle(
                    fontFamily: 'Sukar',
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                width: 20,
              ),

              /// main pic 2
              FluxImage(
                imageUrl: homeItemModel.iconPath!,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
