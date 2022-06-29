import 'package:developer/widgets/unber_constract_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screens.dart';
import '../../../widgets/depart_item_widget.dart';
import '../../doctor_list_page/doctors_list_view.dart';
import 'clinic_list_logic.dart';

class ClinicsListPage extends StatelessWidget {
  final logic = Get.put(ClinicsListLogic());
  static const String id = "/clinics_list_page";

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
                List<DepartItemWgt> clinicItems = List<DepartItemWgt>.from(
                  logic.mainItemList.value.map(
                    (item) {
                      numPostion++;
                      return DepartItemWgt(
                        homeItemModel: item,
                        index: numPostion,
                        hasRating: false,
                        onPressed: () {
                          Get.to(() => DoctorListPage());
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
                            itemCount: clinicItems.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenDevices.heigth(context) * 0.01),
                                child: clinicItems[index],
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
