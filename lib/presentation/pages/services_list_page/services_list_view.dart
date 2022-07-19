import 'package:developer/presentation/pages/booking_doctor/booking_doctor_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import '../../../widgets/title_button_widget.dart';
import 'services_list_logic.dart';

class ServicesListPage extends StatelessWidget {
  final serviceListLogic = Get.put(ServicesListLogic());

  static const String id = "/services_list";
  dynamic argumentData = Get.arguments;
  ServicesListPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(serviceListLogic.title.value),
          ),
          body: Container(
            margin: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child:

                      /// ---
                      Container(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        //WebBarWidget(),
                        Expanded(
                            child: (() {
                          if (serviceListLogic.isLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (serviceListLogic.isLoading.value ==
                                  false &&
                              serviceListLogic.serviceItemsList.isEmpty) {
                            return Center(
                                child: MessageImgButtonWdgt(
                                    title: kNoParentDepTxt,
                                    imageUrl: kOrderBoxImg));
                          } else {
                            return Container(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:
                                    serviceListLogic.serviceItemsList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical:
                                            ScreenDevices.heigth(context) *
                                                0.01),
                                    child: TitleButtonWidget(
                                      title:
                                          '${serviceListLogic.serviceItemsList[index].name}',
                                      subTitle:
                                          ' السعر ${serviceListLogic.serviceItemsList[index].price} جنية ',
                                      rightImgPath: serviceListLogic
                                          .serviceItemsList[index].image,
                                      onPressed: () {
                                        serviceListLogic.idGo?.value =
                                            serviceListLogic
                                                .serviceItemsList[index].id!;
                                        Get.to(() => BookingDoctorPage());
                                      },
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
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
