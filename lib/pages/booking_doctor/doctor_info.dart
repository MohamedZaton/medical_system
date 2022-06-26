import 'package:flutter/material.dart';

import '../../models/booking_doctor_model.dart';
import '../../tools/colors.dart';
import '../../utils/images_path.dart';
import '../../utils/screens.dart';
import '../../widgets/shadow_btn_widget.dart';

class DoctorInfoPage extends StatelessWidget {
  const DoctorInfoPage({
    Key? key,
    required this.doctorInfoModel,
  }) : super(key: key);

  final BookingDoctorModel? doctorInfoModel;

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
                height: ScreenDevices.width(context) * 0.05,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: "مطروع العوام عمارة ٢",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.width(context) * 0.05,
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
                height: ScreenDevices.width(context) * 0.05,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name:
                      "من ${doctorInfoModel!.dayStart} إلي  ${doctorInfoModel!.dayEnd}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.width(context) * 0.05,
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
                width: ScreenDevices.width(context) * 0.70,
                height: ScreenDevices.heigth(context) * 0.03,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name:
                      " من ${doctorInfoModel!.timeStart} إلي  ${doctorInfoModel!.timeEnd}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.15,
                height: ScreenDevices.heigth(context) * 0.04,
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
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.40,
                height: ScreenDevices.heigth(context) * 0.05,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: " ${doctorInfoModel!.clinicPrice}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.40,
                height: ScreenDevices.heigth(context) * 0.05,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: "كشف عيادة",
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.40,
                height: ScreenDevices.heigth(context) * 0.05,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: " ${doctorInfoModel!.homePrice}",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevices.width(context) * 0.40,
                height: ScreenDevices.heigth(context) * 0.05,
                child: ShadowButton(
                  backgroundColor: kSeeMoreColor,
                  name: "كشف منزلى",
                  onPressed: () {},
                ),
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
