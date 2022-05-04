import 'package:developer/models/booking_doctor_model.dart';
import 'package:developer/tools/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'flux_image.dart';

class DoctorItemWgt extends StatelessWidget {
  final BookingDoctorModel doctorItemModel;
  final int index;
  final Function()? onPressed;
  const DoctorItemWgt({
    Key? key,
    required this.doctorItemModel,
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
                doctorItemModel.name!,
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
                imageUrl: doctorItemModel.imagePath!,
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
