import 'package:developer/core/utils/screens.dart';
import 'package:developer/tools/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import '../../../widgets/parent_depart_widget.dart';
import '../medical_form/medical_form_view.dart';
import 'depart_logic.dart';

class DepartmentPage extends StatelessWidget {
  final logic = Get.put(DepartmentLogic());
  static const String id = "/department";

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            title: Text(kDepartmentsTxt),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                logic.fetchSubList(logic.idParentBack?.value);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  /// back to home page
                  logic.fetchSubList(-1);
                },
              ),
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: [
                //WebBarWidget(),

                Expanded(
                    child: (() {
                  if (logic.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (logic.isLoading.value == false &&
                      logic.mainItemList.length <= 0) {
                    return Center(
                        child: MessageImgButtonWdgt(
                            message: kNoParentDepTxt, imageUrl: kOrderBoxImg));
                  } else {
                    return Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: logic.mainItemList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenDevices.heigth(context) * 0.01),
                            child: ParentDpItemWgt(
                              homeItemModel: logic.mainItemList[index],
                              onPressed: () {
                                logic.typeGo.value =
                                    logic.mainItemList[index].type.toString();
                                logic.idGo?.value =
                                    logic.mainItemList[index].id!;
                                try {
                                  logic.idParentBack?.value =
                                      logic.mainItemList[index].parentId ?? -1;
                                } catch (e) {
                                  logic.idParentBack?.value = int.parse(
                                      logic.mainItemList[index].parentId);
                                }

                                switch (logic.typeGo.value) {
                                  case kRegularFlowKey:
                                    {
                                      logic.fetchSubList(logic.idGo?.value);
                                      break;
                                    }
                                  case kUploadFlowKey:
                                    {
                                      Get.to(() => MedicalFormPage(
                                            pharmacyTitle: logic
                                                    .mainItemList[index]
                                                    .nameAr ??
                                                kPharmacyTitleKey,
                                            isRate: false,
                                            pharmacyLogo: logic
                                                    .mainItemList[index].icon ??
                                                kAddPhotoImg,
                                            onSend: () {
                                              /// id process
                                            },
                                          ));
                                      break;
                                    }
                                }
                              },
                              index: index,
                            ),
                          );
                        },
                      ),
                    );
                  }
                }())),
              ],
            ),
          ),
        );
      }),
    );
  }
}
