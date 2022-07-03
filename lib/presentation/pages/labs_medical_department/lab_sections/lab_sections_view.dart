import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/images_path.dart';
import '../../../../core/utils/screens.dart';
import '../../../../tools/constants.dart';
import '../../../../widgets/title_button_widget.dart';
import '../../medical_form/medical_form_view.dart';
import '../../places_list/labs_list/labs_list_view.dart';
import '../medical_analyses_list/medical_analyses_list_view.dart';
import 'lab_sections_logic.dart';

class LabSectionsPage extends StatelessWidget {
  final logic = Get.put(LabSectionsLogic());
  static const String id = "/lab_section_page";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LabSectionsLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            kChooseTypeBookingTxt,
          ),
          centerTitle: true,
        ),
        body: Container(
          width: ScreenDevices.width(context),
          height: ScreenDevices.heigth(context) * 0.80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(height: 50),
              Column(
                children: [
                  TitleButtonWidget(
                      title: kUploadDoctorPaperTxt,
                      rightImgPath: kAddPhotoImg,
                      radius: 20,

                      /// choose upload picture
                      onPressed: () {
                        logic.selectedLabSection(MedicalFormPage.id);
                        Get.to(() => LabsListPage());
                      }),
                  SizedBox(
                    height: 6,
                  ),
                  TitleButtonWidget(
                      title: kChooseTypeTestsTxt,
                      rightImgPath: kMicroScopeImg,
                      radius: 20,

                      /// choose type tests
                      onPressed: () {
                        logic.selectedLabSection(MedicalAnalysesListPage.id);
                        Get.to(() => LabsListPage());
                      }),
                  SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
