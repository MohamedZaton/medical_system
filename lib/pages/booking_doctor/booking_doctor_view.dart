import 'package:developer/pages/booking_doctor/patient_booking.dart';
import 'package:developer/pages/message/message_view.dart';
import 'package:developer/tools/colors.dart';
import 'package:developer/tools/constants.dart';
import 'package:developer/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utils/screens.dart';
import '../../widgets/flux_image.dart';
import '../../widgets/shadow_btn_widget.dart';
import 'booking_doctor_logic.dart';
import 'doctor_info.dart';

class BookingDoctorPage extends StatelessWidget {
  final logic = Get.put(BookingDoctorLogic());
  static const String id = "/doctors_booking";

  BookingDoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingDoctorLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text(kDoctorBk),
        ),
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: ScreenDevices.heigth(context) * 0.8,
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      /// image doctor avatar
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: kDarkAccent),
                        width: 100,
                        height: 100,
                        child: FluxImage(
                          imageUrl: logic.selectedDoctorModel.value.imagePath!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),

                      ///  name doctor
                      Text(
                        logic.selectedDoctorModel.value.name!,
                        style: kHeaderTextStyle.copyWith(color: kDarkAccent),
                      ),
                      SizedBox(
                        height: 280,
                        child: IndexedStack(
                          index: logic.bookingPage,
                          children: [
                            DoctorInfoPage(
                                doctorInfoModel:
                                    logic.selectedDoctorModel.value),
                            PatientBkPage(
                                doctorInfoModel:
                                    logic.selectedDoctorModel.value),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        height: ScreenDevices.heigth(context) * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: ScreenDevices.width(context) * 0.40,
                              child: ShadowButton(
                                backgroundColor: kDarkAccent,
                                name: " احجز ",
                                onPressed: () {
                                  if (logic.bookingPage == 1) {
                                    Get.to(() => MessagePage());
                                  } else {
                                    logic.nextPage(page: 1);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            (logic.bookingPage > 0)
                                ? Container(
                                    width: ScreenDevices.width(context) * 0.40,
                                    child: ShadowButton(
                                      backgroundColor: kDarkAccent,
                                      name: " رجوع ",
                                      onPressed: () {
                                        logic.previousPage();
                                      },
                                    ),
                                  )
                                : SizedBox(
                                    width: 1,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
