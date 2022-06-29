import 'package:developer/models/booking_lab_model.dart';
import 'package:developer/pages/places_list/labs_list/labs_list_logic.dart';
import 'package:developer/tools/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screens.dart';
import '../../../widgets/title_button_widget.dart';
import '../../../widgets/unber_constract_widget.dart';
import '../labs_booking/labs_booking_logic.dart';
import '../labs_booking/labs_booking_view.dart';
import 'medical_analyses_list_logic.dart';

class MedicalAnalysesListPage extends StatelessWidget {
  final logic = Get.put(MedicalAnalysesListLogic());
  final labBookingLogic = Get.put(LabsBookingLogic());
  final labsListLogic = Get.put(LabsListLogic());

  static const String id = "/medical_analyses_list";

  MedicalAnalysesListPage({Key? key}) : super(key: key);

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
                List<TitleButtonWidget> analysesItems =
                    List<TitleButtonWidget>.from(
                        logic.mainItemList.value.map((item) {
                  return TitleButtonWidget(
                      radius: 20,
                      title: '${item.type}  ${item.price.toString()} جنية ',
                      onPressed: () {
                        labBookingLogic.selectedLabModel.value =
                            BookingLabModel(
                          address: kDemoAddressOneTxt,
                          dayStart: "السبت",
                          dayEnd: "الخميس",
                          timeStart: "09:30 ص ",
                          timeEnd: "05:30 م ",
                          name: labsListLogic.selectedLab.value.department,
                          imagePath: labsListLogic.selectedLab.value.iconPath,
                          analysesPrice: item.price.toString(),
                        );
                        Get.to(() => LabsBookingPage());
                      });
                }));
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return (logic.mainItemList.value.length > 0)
                      ? Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: analysesItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenDevices.heigth(context) * 0.01),
                                child: analysesItems[index],
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
