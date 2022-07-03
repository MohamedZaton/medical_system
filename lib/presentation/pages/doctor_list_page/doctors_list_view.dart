import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/doctor_item_widget.dart';
import '../../../../widgets/unber_constract_widget.dart';
import '../../../core/utils/math_methods.dart';
import '../../../core/utils/screens.dart';
import '../../../data/models/division_model.dart';
import '../../../tools/constants.dart';
import '../booking_doctor/booking_doctor_logic.dart';
import '../booking_doctor/booking_doctor_view.dart';
import '../divisions/division_view.dart';
import '../divisions/divisions_logic.dart';
import 'doctors_list_logic.dart';

class DoctorListPage extends StatelessWidget {
  final logic = Get.put(DoctorsListLogic());
  final divisonLogic = Get.put(DivisionsLogic());
  final bookingDoctorLogic = Get.put(BookingDoctorLogic());

  static const String id = "/doctors_list";

  DoctorListPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(logic.title.value),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //WebBarWidget(),

              Expanded(child: Obx(() {
                int numPostion = -1;
                List<DoctorItemWgt> doctorsItems = List<DoctorItemWgt>.from(
                  logic.mainItemList.value.map(
                    (item) {
                      numPostion++;
                      return DoctorItemWgt(
                        doctorItemModel: item,
                        index: numPostion,
                        initialRating: MathMethods.getRandom(1, 5),
                        onPressed: () {
                          divisonLogic.itemTypeList.value = [
                            DivisionModel(
                              title:
                                  '$kClinicExaminationTxt  ${item.clinicPrice}',
                              pageWidgetPath: BookingDoctorPage(),
                            ),
                            DivisionModel(
                              title: '$kHomeExaminationTxt  ${item.homePrice}',
                              pageWidgetPath: BookingDoctorPage(),
                            ),
                          ];

                          bookingDoctorLogic.selectedDoctorModel.value = item;
                          divisonLogic.title.value = logic.title.value;
                          Get.to(() => DivisionsPage());
                        },
                      );
                    },
                  ),
                );
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return (logic.mainItemList.value.length > 0)
                      ? Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: doctorsItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenDevices.heigth(context) * 0.01),
                                child: doctorsItems[index],
                              );
                            },
                          ),
                        )
                      : UnderConstructionWidget();
                }
              })),
            ],
          ),
        ),
      ),
    );
  }
}
