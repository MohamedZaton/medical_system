import 'package:developer/data/models/service_details_model.dart'
    as serviceDetails;
import 'package:developer/tools/constants.dart';
import 'package:developer/widgets/oval_btn_widget.dart';
import 'package:developer/widgets/side_menu_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/shadow_btn_widget.dart';
import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/colors.dart';
import '../../../tools/styles.dart';
import '../divisions/divisions_logic.dart';
import 'booking_doctor_logic.dart';

class PatientBkPage extends StatelessWidget {
  final logic = Get.put(BookingDoctorLogic());
  final divisionsLogic = Get.put(DivisionsLogic());
  DateTime initDate = DateTime.now();
  final serviceDetails.Data? doctorInfoModel;

  PatientBkPage({
    Key? key,
    required this.doctorInfoModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDoctorLogic>(builder: (logic) {
      Future<dynamic> selectAddressDialog(BookingDoctorLogic controller) {
        return Get.defaultDialog(
          title: kSelectedAddressTxt,
          titleStyle: TextStyle(color: kLightAccent),
          middleTextStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.white,
          content: Container(
            height: ScreenDevices.heigth(context) * 0.60,
            width: ScreenDevices.width(context) * 0.70,
            child: ListView(
              children: [
                OvalButtonWdgt(
                  text: kDemoAddressOneTxt,
                  onPressed: () {
                    controller.choseAddress(kDemoAddressOneTxt);
                    Get.back();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                OvalButtonWdgt(
                  text: kDemoAddressTwoTxt,
                  onPressed: () {
                    controller.choseAddress(kDemoAddressTwoTxt);
                    Get.back();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                OvalButtonWdgt(
                  text: kDemoAddressThreeTxt,
                  onPressed: () {
                    controller.choseAddress(kDemoAddressThreeTxt);
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        );
      }

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

      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () {
                /// calender piker popup
                _selectCalenderPicker(context);
              },
              child: SideMenuButton(
                  width: ScreenDevices.width(context) * 0.90,
                  height: ScreenDevices.heigth(context) * 0.05,
                  centerTitle: logic.selectDayTitle,
                  rightImagePath: kCalenderIcon),
            ),

            /// select time
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                _selectTimePicker(context);
              },
              child: SideMenuButton(
                  width: ScreenDevices.width(context) * 0.90,
                  height: ScreenDevices.heigth(context) * 0.05,
                  centerTitle: logic.selectTimeTitle,
                  iconScale: 10,
                  rightImagePath: kClockWallIcon),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${doctorInfoModel?.name.toString()} ${kPriceTxt}",
                style: kTitleTextStyle.copyWith(color: kDarkAccent),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: ScreenDevices.width(context) * 0.90,
                  height: ScreenDevices.heigth(context) * 0.05,
                  child: ShadowButton(
                    backgroundColor: kDarkAccent,
                    name: " ${kEgpTxt} ${doctorInfoModel!.price} ",
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
    });
  }
}
