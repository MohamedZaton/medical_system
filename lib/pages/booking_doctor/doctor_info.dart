import 'package:flutter/material.dart';

import '../../models/booking_doctor_model.dart';
import '../../tools/colors.dart';
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
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: ScreenDevice.width(context) * 0.70,
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
              width: ScreenDevice.width(context) * 0.15,
              height: ScreenDevice.width(context) * 0.15,
              child: Image.asset(
                "assets/icons/calender_month.png",
                width: 40,
                height: 40,
              ),
              decoration: BoxDecoration(
                  color: kSeeMoreColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: ScreenDevice.width(context) * 0.70,
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
              width: ScreenDevice.width(context) * 0.15,
              height: ScreenDevice.width(context) * 0.15,
              child: Image.asset(
                "assets/icons/wall-clock.png",
                scale: 6,
              ),
              decoration: BoxDecoration(
                  color: kSeeMoreColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: ScreenDevice.width(context) * 0.40,
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
              width: ScreenDevice.width(context) * 0.40,
              child: ShadowButton(
                backgroundColor: kSeeMoreColor,
                name: "كشف عيادة",
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: ScreenDevice.width(context) * 0.40,
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
              width: ScreenDevice.width(context) * 0.40,
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
    );
  }
}
