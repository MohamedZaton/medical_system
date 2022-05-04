import 'package:developer/tools/api_keys.dart';
import 'package:developer/tools/colors.dart';
import 'package:developer/utils/screens.dart';
import 'package:developer/widgets/flux_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../tools/constants.dart';
import '../../widgets/shadow_btn_widget.dart';
import 'medical_form_logic.dart';

class MedicalFormPage extends StatelessWidget {
  final logic = Get.put(MedicalFormLogic());
  static const String id = "/medical_form";
  final String pharmacyLogo;
  final String pharmacyTitle;

  MedicalFormPage(
      {Key? key,
      this.pharmacyLogo = "assets/pharmacies/life.png",
      this.pharmacyTitle = kPharmacyTitleKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              alignment: Alignment.center,
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
                            logic.getImage();
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: ScreenDevice.width(context) * 0.70,
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
                  (logic.isAttached)
                      ? Container(
                          width: ScreenDevice.width(context) * 0.70,
                          child: ShadowButton(
                            backgroundColor: kDarkAccent,
                            name: kSendPaperText,
                            onPressed: () {},
                          ),
                        )
                      : SizedBox(
                          height: 10,
                        ),
                ],
              ),
            );
          },
        ));
  }
}
