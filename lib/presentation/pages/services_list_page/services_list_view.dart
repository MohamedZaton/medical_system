import 'package:developer/presentation/pages/service_provider/service_provider_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/images_path.dart';
import '../../../core/utils/screens.dart';
import '../../../tools/constants.dart';
import '../../../widgets/message_img_btn_widget.dart';
import '../../../widgets/title_button_widget.dart';
import '../booking_doctor/booking_doctor_logic.dart';
import '../divisions/divisions_logic.dart';
import 'services_list_logic.dart';

class ServicesListPage extends StatelessWidget {
  final serviceListLogic = Get.put(ServicesListLogic());
  final divisonLogic = Get.put(DivisionsLogic());
  final bookingDoctorLogic = Get.put(BookingDoctorLogic());

  static const String id = "/services_list";

  ServicesListPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();
    /// find method transfer data between views
    final servProviderLogic = Get.find<ServiceProviderLogic>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(serviceListLogic.title.value),
        ),
        body: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: Obx(() {
                int? idServProvider = servProviderLogic.idGo?.value;
                if (idServProvider != null) {
                  serviceListLogic.idGo?.value = idServProvider;
                }

                /// ---
                return Container(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      //WebBarWidget(),
                      Expanded(
                          child: (() {
                        if (serviceListLogic.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (serviceListLogic.isLoading.value == false &&
                            serviceListLogic.serviceItemsList.isEmpty) {
                          return Center(
                              child: MessageImgButtonWdgt(
                                  message: kNoParentDepTxt,
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
                                          ScreenDevices.heigth(context) * 0.01),
                                  child: TitleButtonWidget(
                                    title:
                                        '${serviceListLogic.serviceItemsList[index].name} ${serviceListLogic.serviceItemsList[index].price} جنية ',
                                    rightImgPath: serviceListLogic
                                        .serviceItemsList[index].image,
                                    onPressed: () {
                                      /// details id
                                      /// go details services
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
                );
              })),
            ],
          ),
        ),
      ),
    );
  }
}
