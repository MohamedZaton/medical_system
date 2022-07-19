import 'package:developer/core/utils/screens.dart';
import 'package:developer/data/models/upload_model.dart';
import 'package:developer/data/models/zones_model.dart' as zoneList;
import 'package:developer/presentation/pages/orders_page/orders_logic.dart';
import 'package:developer/tools/colors.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../widgets/oval_btn_widget.dart';
import '../../../../widgets/shadow_btn_widget.dart';
import '../../../core/utils/images_path.dart';
import '../../../tools/api_keys.dart';
import '../../../tools/constants.dart';
import 'medical_form_logic.dart';

class MedicalFormPage extends StatelessWidget {
  final logic = Get.put(MedicalFormLogic());
  final orderLogic = Get.find<OrdersLogic>();
  static const String id = "/medical_form";
  final String pharmacyLogo;
  final String pharmacyTitle;
  final bool? isRate;
  final String? serviceId;
  final String? zoneId;

  MedicalFormPage({
    Key? key,
    this.pharmacyLogo = kAddPhotoImg,
    this.pharmacyTitle = kPharmacyTitleKey,
    this.isRate = false,
    this.serviceId = '1',
    this.zoneId = '1',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("[MedicalFormPage ] serviceId : $zoneId");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            pharmacyTitle,
          ),
        ),
        body: GetBuilder<MedicalFormLogic>(
          init: MedicalFormLogic(),
          assignId: true,
          builder: (logic) {
            return Container(
              alignment: Alignment.topCenter,
              width: ScreenDevices.width(context),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    (logic.isAttached == false)
                        ? FluxImage(
                            imageUrl: pharmacyLogo,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            logic.image,
                            height: 300.0,
                            fit: BoxFit.cover,
                          ),
                    SizedBox(
                      height: 20,
                    ),
                    if (isRate == true) ...[
                      Container(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        FloatingActionButton(
                            heroTag: "upload_image",
                            child: Icon(Icons.add_a_photo_sharp),
                            backgroundColor: kDarkAccent,
                            onPressed: () {
                              logic.setUploadModel(UploadModel(
                                serviceId: serviceId,
                                zoneId: logic.selectedZoneId.toString(),
                                serviceProviderId: serviceId,
                              ));
                              logic.getImage();
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: ScreenDevices.width(context) * 0.70,
                          child: ShadowButton(
                            backgroundColor: kSeeMoreColor,
                            name: kDoctorPaperText,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (logic.zonesList!.length > 0) ...[
                      Container(
                        width: ScreenDevices.width(context) * 0.90,
                        child: ShadowButton(
                          backgroundColor: kDarkAccent,
                          name: logic.selectedZoneName,
                          onPressed: () {
                            selectAddressDialog(
                                logic, context, logic.zonesList);
                          },
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 10,
                    ),
                    if (logic.isAttached) ...[
                      Column(
                        children: [
                          Container(
                            width: ScreenDevices.width(context) * 0.70,
                            child: ShadowButton(
                              backgroundColor: kDarkAccent,
                              name: kSendPaperText,
                              onPressed: () {
                                if (logic.imagePath != null) {
                                  logic.sendMedicalPaper();
                                  orderLogic.fetchList();
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ],
                ),
              ),
            );
          },
        ));
  }

  Future<dynamic> selectAddressDialog(MedicalFormLogic controller,
      BuildContext context, List<zoneList.Data>? addressZonesList) {
    return Get.defaultDialog(
      title: kSelectedAddressTxt,
      titleStyle: TextStyle(color: kLightAccent),
      middleTextStyle: TextStyle(color: Colors.black),
      backgroundColor: Colors.white,
      content: Container(
        height: ScreenDevices.heigth(context) * 0.50,
        width: ScreenDevices.width(context) * 0.70,
        child: ListView(
          children: addressZonesList!.map((item) {
            return Column(
              children: [
                OvalButtonWdgt(
                  text: item.nameAr!,
                  onPressed: () {
                    controller.choseAddressPharmices(item.id);
                    controller.choseAddressName(item.nameAr);

                    Get.back();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
