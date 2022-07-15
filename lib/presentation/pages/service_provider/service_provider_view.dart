import 'package:developer/presentation/pages/services_list_page/services_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/api_keys.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import '../../../widgets/service_pr_item_widget.dart';
import '../medical_form/medical_form_view.dart';
import '../parents_departments_page/depart_logic.dart';
import 'service_provider_logic.dart';

class ServiceProviderPage extends StatelessWidget {
  static const String id = "/service_provider";

  final servProviderLogic = Get.put(ServiceProviderLogic());

  /// find method transfer data between views
  final depLogic = Get.put(DepartmentLogic());

  ServiceProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kServiceProviderTxt),
        centerTitle: true,
      ),
      body: Obx(() {
        return Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              //WebBarWidget(),
              Expanded(
                  child: (() {
                if (servProviderLogic.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (servProviderLogic.isLoading.value == false &&
                    servProviderLogic.servicePrItemList.length <= 0) {
                  return Center(
                      child: MessageImgButtonWdgt(
                          title: kNoParentDepTxt, imageUrl: kOrderBoxImg));
                } else {
                  return Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: servProviderLogic.servicePrItemList.length,
                      itemBuilder: (context, index) {
                        int rateInt = int.parse(servProviderLogic
                            .servicePrItemList[index].rate
                            .toString());
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenDevices.heigth(context) * 0.01),
                          child: ServicePrItemWgt(
                            serviceItemModel:
                                servProviderLogic.servicePrItemList[index],
                            hasRating: true,
                            initialRating: rateInt.toDouble(),
                            onPressed: () {
                              servProviderLogic.typeGo.value = servProviderLogic
                                  .servicePrItemList[index].flowType
                                  .toString();
                              servProviderLogic.idGo?.value = servProviderLogic
                                  .servicePrItemList[index].id!;
                              switch (servProviderLogic.typeGo.value) {
                                case kRegularFlowValue:
                                  {
                                    print(
                                        "[ServiceProvider][flow-type ] --> ${kRegularFlowValue}");

                                    /// old
                                    // servLogic.fetchServerProviderList();
                                    /// new
                                    Get.to(() => ServicesListPage());

                                    break;
                                  }
                                case kUploadFlowValue:
                                  {
                                    print(
                                        "[ServiceProvider][flow-type ] --> ${kUploadFlowValue}");
                                    Get.to(() => MedicalFormPage(
                                          serviceId: servProviderLogic
                                              .servicePrItemList[index].id
                                              .toString(),
                                          zoneId: servProviderLogic
                                              .servicePrItemList[index].id
                                              .toString(),
                                          pharmacyTitle: servProviderLogic
                                                  .servicePrItemList[index]
                                                  .name ??
                                              kPharmacyTitleKey,
                                          isRate: true,
                                          pharmacyLogo: servProviderLogic
                                                  .servicePrItemList[index]
                                                  .logo ??
                                              kAddPhotoImg,
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
        );
      }),
    );
  }
}
