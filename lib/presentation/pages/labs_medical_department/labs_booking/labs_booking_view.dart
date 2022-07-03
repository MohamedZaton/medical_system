import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/utils/screens.dart';
import '../../../../tools/colors.dart';
import '../../../../tools/constants.dart';
import '../../../../tools/styles.dart';
import '../../../../widgets/flux_image.dart';
import '../../../../widgets/shadow_btn_widget.dart';
import '../../message/message_view.dart';
import 'lab_patient_booking.dart';
import 'labs_booking_logic.dart';
import 'labs_info.dart';

class LabsBookingPage extends StatelessWidget {
  final logic = Get.put(LabsBookingLogic());
  static const String id = "/labs_booking_view";

  LabsBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LabsBookingLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text(kLabsBk),
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
                          imageUrl: logic.selectedLabModel.value.imagePath!,
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
                        logic.selectedLabModel.value.name!,
                        style: kHeaderTextStyle.copyWith(color: kDarkAccent),
                      ),
                      SizedBox(
                        height: 280,
                        child: IndexedStack(
                          index: logic.bookingPage,
                          children: [
                            LabInfoPage(
                                labInfoModel: logic.selectedLabModel.value),
                            LabPatientBkPage(
                                labInfoModel: logic.selectedLabModel.value),
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
