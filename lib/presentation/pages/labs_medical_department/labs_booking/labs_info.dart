import 'package:developer/data/models/booking_lab_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/images_path.dart';
import '../../../../core/utils/screens.dart';
import '../../../../tools/colors.dart';
import '../../../../tools/constants.dart';
import '../../../../widgets/shadow_btn_widget.dart';

class LabInfoPage extends StatelessWidget {
  const LabInfoPage({
    Key? key,
    required this.labInfoModel,
  }) : super(key: key);

  final BookingLabModel? labInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenDevices.heigth(context) * 0.60,
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),

          /// address doctor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: ScreenDevices.width(context) * 0.70,
                height: ScreenDevices.width(context) * 0.09,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: kDemoAddressFourTxt,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.width(context) * 0.09,
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                decoration: BoxDecoration(
                    color: kSeeMoreColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          /// work days doctor
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.70,
                height: ScreenDevices.width(context) * 0.09,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name:
                      "من ${labInfoModel!.dayStart} إلي  ${labInfoModel!.dayEnd}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.width(context) * 0.09,
                child: Image.asset(
                  kCalenderIcon,
                  scale: 3,
                ),
                decoration: BoxDecoration(
                    color: kSeeMoreColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          /// work time day
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.72,
                height: ScreenDevices.heigth(context) * 0.06,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name:
                      " من ${labInfoModel!.timeStart} إلي  ${labInfoModel!.timeEnd}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.heigth(context) * 0.06,
                child: Image.asset(
                  kClockWallIcon,
                  scale: 20,
                ),
                decoration: BoxDecoration(
                    color: kSeeMoreColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
            ],
          ),

          SizedBox(
            height: 3,
          ),
        ],
      ),
    );
  }
}
