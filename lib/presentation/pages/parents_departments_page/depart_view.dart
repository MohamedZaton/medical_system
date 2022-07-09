import 'package:developer/core/utils/screens.dart';
import 'package:developer/presentation/pages/service_provider/service_provider_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import '../../../widgets/parent_depart_widget.dart';
import 'depart_logic.dart';

class DepartmentPage extends StatelessWidget {
  final depLogic = Get.put(DepartmentLogic());
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
                depLogic.fetchSubList(depLogic.idParentBack?.value);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: () {
                  /// back to home page
                  depLogic.fetchSubList(-1);
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
                  if (depLogic.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (depLogic.isLoading.value == false &&
                      depLogic.mainItemList.length <= 0) {
                    return Center(
                        child: MessageImgButtonWdgt(
                            message: kNoParentDepTxt, imageUrl: kOrderBoxImg));
                  } else {
                    return Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: depLogic.mainItemList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenDevices.heigth(context) * 0.01),
                            child: ParentDpItemWgt(
                              homeItemModel: depLogic.mainItemList[index],
                              onPressed: () {
                                depLogic.typeGo.value = depLogic
                                    .mainItemList[index].type
                                    .toString();
                                depLogic.idGo?.value =
                                    depLogic.mainItemList[index].id!;
                                try {
                                  depLogic.idParentBack?.value =
                                      depLogic.mainItemList[index].parentId ??
                                          -1;
                                } catch (e) {
                                  depLogic.idParentBack?.value = int.parse(
                                      depLogic.mainItemList[index].parentId);
                                }

                                nextNavigatorPage(depLogic, index);
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

  void nextNavigatorPage(DepartmentLogic departLogic, int index) async {
    int? id = departLogic.idGo?.value;
    bool isServiceProvider = await departLogic.checkIsFlowType(id);

    if (isServiceProvider == true) {
      Get.to(() => ServiceProviderPage());
    } else {
      departLogic.fetchSubList(departLogic.idGo?.value);
    }
  }
}
/*
   switch (logic.typeGo.value) {
      case kRegularFlowValue:
        {
          logic.fetchSubList(logic.idGo?.value);
          break;
        }
      case kUploadFlowValue:
        {
          Get.to(() => MedicalFormPage(
                pharmacyTitle:
                    logic.mainItemList[index].nameAr ?? kPharmacyTitleKey,
                isRate: false,
                pharmacyLogo: logic.mainItemList[index].icon ?? kAddPhotoImg,
                onSend: () {
                  /// id process
                },
              ));
          break;
        }
    }
*/
