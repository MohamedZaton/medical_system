import 'package:developer/tools/constants.dart';
import 'package:developer/widgets/depart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screens.dart';
import '../../../widgets/unber_constract_widget.dart';
import '../../medical_form/medical_form_view.dart';
import '../../message/message_view.dart';
import 'pharmacies_list_logic.dart';

class PharmaciesListPage extends StatelessWidget {
  final logic = Get.put(PharmaciesListLogic());
  static const String id = "/pharmacies_list_page";

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
                List<DepartItemWgt> mainItemList = List<DepartItemWgt>.from(
                  logic.mainItemList.value.map(
                    (item) {
                      numPostion++;
                      return DepartItemWgt(
                        homeItemModel: item,
                        index: numPostion,
                        hasRating: true,
                        onPressed: () {
                          Get.to(MedicalFormPage(
                            pharmacyLogo: item.iconPath.toString(),
                            pharmacyTitle: item.department.toString(),
                            isRate: true,
                            onSend: () {
                              Get.to(() => MessagePage());
                            },
                            addressList: [
                              kDemoAddressOneTxt,
                              kDemoAddressTwoTxt,
                              kDemoAddressThreeTxt
                            ],
                          ));
                        },
                      );
                    },
                  ),
                );
                if (logic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return (mainItemList.length > 0)
                      ? Container(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: mainItemList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenDevices.heigth(context) * 0.01),
                                child: mainItemList[index],
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
