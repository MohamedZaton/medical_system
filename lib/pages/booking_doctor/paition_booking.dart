import 'package:developer/pages/booking_doctor/booking_doctor_logic.dart';
import 'package:developer/widgets/edit_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/booking_doctor_model.dart';
import '../../tools/colors.dart';
import '../../tools/constants.dart';
import '../../tools/styles.dart';
import '../../utils/screens.dart';
import '../../widgets/shadow_btn_widget.dart';

class PatientBkPage extends StatelessWidget {
  final logic = Get.put(BookingDoctorLogic());
  DateTime initDate = DateTime.now();

  PatientBkPage({
    Key? key,
    required this.doctorInfoModel,
  }) : super(key: key);

  final BookingDoctorModel? doctorInfoModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDoctorLogic>(builder: (logic) {
      Future<void> _selectCalenderPicker(BuildContext context) async {
        final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: initDate,
            firstDate: logic.selectedDate,
            lastDate: DateTime(2044));
        if (picked != null) {
          logic.selectDayVisit(picked);
        }
      }

      Future<void> _selectTimePicker(BuildContext context) async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: initDate.hour, minute: initDate.minute),
        );

        if (picked != null) {
          logic.selectTimeVisit(picked);
        }
      }

      return Column(
        children: [
          SizedBox(
            height: 20,
          ),

          InkWell(
            onTap: () {
              /// calender piker popup
              _selectCalenderPicker(context);
            },
            child: Container(
              width: ScreenDevice.width(context) * 0.90,
              height: ScreenDevice.width(context) * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white,
                  ),
                  kCustomText(logic.selectDayTitle,
                      fontSize: textSizeLargeMedium,
                      textColor: Colors.white,
                      fontFamily: fontMedium),
                  Image.asset(
                    "assets/icons/calender_month.png",
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: kDarkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),

          /// select time
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              //todo time picker popup
              _selectTimePicker(context);
            },
            child: Container(
              width: ScreenDevice.width(context) * 0.90,
              height: ScreenDevice.width(context) * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white,
                  ),
                  kCustomText(logic.selectTimeTitle,
                      fontSize: textSizeLargeMedium,
                      textColor: Colors.white,
                      fontFamily: fontMedium),
                  Image.asset(
                    "assets/icons/wall-clock.png",
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: kDarkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "اختيار نوع الكشف",
              style: kTitleTextStyle.copyWith(color: kDarkAccent),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: ScreenDevice.width(context) * 0.90,
                child: ShadowButton(
                  backgroundColor: (logic.isHomeVisited == false)
                      ? kDarkAccent
                      : kSeeMoreColor,
                  name: "  كشف عيادة ${doctorInfoModel!.clinicPrice} ",
                  onPressed: () {
                    logic.selectHomePriceVisit(select: false);
                  },
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
                width: ScreenDevice.width(context) * 0.90,
                child: ShadowButton(
                  backgroundColor:
                      (logic.isHomeVisited) ? kDarkAccent : kSeeMoreColor,
                  name: "  كشف منزلى ${doctorInfoModel!.homePrice} ",
                  onPressed: () {
                    logic.selectHomePriceVisit(select: true);
                  },
                ),
              ),
            ],
          ),

          SizedBox(
            height: 20,
          ),
          (logic.isHomeVisited)
              ? EditTextStyle(kAddressTxt)
              : SizedBox(
                  height: 10,
                ),
          SizedBox(
            height: 20,
          ),
        ],
      );
    });
  }
}
