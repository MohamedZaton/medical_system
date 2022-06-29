import 'package:developer/pages/labs_medical_department/lab_sections/lab_sections_logic.dart';
import 'package:developer/pages/medical_form/medical_form_view.dart';
import 'package:developer/pages/message/message_view.dart';
import 'package:developer/widgets/depart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screens.dart';
import '../../../widgets/unber_constract_widget.dart';
import '../../labs_medical_department/medical_analyses_list/medical_analyses_list_view.dart';
import 'labs_list_logic.dart';

class LabsListPage extends StatelessWidget {
  final mainLogic = Get.put(LabsListLogic());
  final labSectionsLogic = Get.put(LabSectionsLogic());

  static const String id = "/labs_list_page";

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(mainLogic.title.value),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: Obx(() {
                int numPostion = -1;
                List<DepartItemWgt> departItems = List<DepartItemWgt>.from(
                  mainLogic.mainItemList.value.map(
                    (item) {
                      numPostion++;
                      return DepartItemWgt(
                        homeItemModel: item,
                        index: numPostion,
                        hasRating: false,
                        onPressed: () {
                          mainLogic.selectedLab.value = item;
                          if (labSectionsLogic.chooseWayUploadOrList ==
                              MedicalFormPage.id) {
                            Get.to(() => MedicalFormPage(
                                  pharmacyTitle: item.department.toString(),
                                  pharmacyLogo: item.iconPath.toString(),
                                  isRate: false,
                                  onSend: () {
                                    Get.to(() => MessagePage());
                                  },
                                ));
                          } else {
                            Get.to(() => MedicalAnalysesListPage());
                          }
                        },
                      );
                    },
                  ),
                );

                if (mainLogic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return (mainLogic.mainItemList.length > 0)
                      ? Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: departItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenDevices.heigth(context) * 0.01),
                                child: departItems[index],
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
