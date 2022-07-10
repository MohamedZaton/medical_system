import 'package:developer/presentation/pages/booking_doctor/patient_booking.dart';
import 'package:developer/tools/colors.dart';
import 'package:developer/tools/constants.dart';
import 'package:developer/tools/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../widgets/flux_image.dart';
import '../../../../widgets/shadow_btn_widget.dart';
import '../../../core/utils/screens.dart';
import '../services_list_page/services_list_logic.dart';
import 'booking_doctor_logic.dart';
import 'doctor_info.dart';

class BookingDoctorPage extends StatelessWidget {
  final servDetailsLogic = Get.put(BookingDoctorLogic());
  final serviceListLogic = Get.find<ServicesListLogic>();

  static const String id = "/doctors_booking";

  BookingDoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int? oldId = serviceListLogic.idGo?.value;
      if (oldId != null) {
        servDetailsLogic.idGo?.value = oldId;
      }
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
                        child: FluxImage(
                          imageUrl: servDetailsLogic
                              .detailsModel.value.serviceProviderLogo
                              .toString(),
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
                          initialRating: 4.0,
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
                      FittedBox(
                        child: Text(
                          servDetailsLogic
                              .detailsModel.value.serviceProviderName
                              .toString(),
                          style: kHeaderTextStyle.copyWith(color: kDarkAccent),
                        ),
                      ),
                      SizedBox(
                        height: 280,
                        child: IndexedStack(
                          index: servDetailsLogic.bookingPage.value,
                          children: [
                            DoctorInfoPage(
                                doctorInfoModel:
                                    servDetailsLogic.detailsModel.value),
                            PatientBkPage(
                                doctorInfoModel:
                                    servDetailsLogic.detailsModel.value),
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
                                  if (servDetailsLogic.bookingPage == 1) {
                                    servDetailsLogic.sendBookingPaper();
                                  } else {
                                    servDetailsLogic.nextPage(page: 1);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            (servDetailsLogic.bookingPage > 0)
                                ? Container(
                                    width: ScreenDevices.width(context) * 0.40,
                                    child: ShadowButton(
                                      backgroundColor: kDarkAccent,
                                      name: " رجوع ",
                                      onPressed: () {
                                        servDetailsLogic.previousPage();
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
