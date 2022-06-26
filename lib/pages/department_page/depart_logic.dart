import 'package:developer/models/depart_item_model.dart';
import 'package:developer/pages/places_list/clinics_list/clinic_list_view.dart';
import 'package:developer/pages/places_list/hospitals_list/hospitals_list_view.dart';
import 'package:developer/pages/places_list/labs_list/labs_list_view.dart';
import 'package:developer/pages/places_list/medical_support_list/medical_support_list_view.dart';
import 'package:developer/pages/places_list/nursing_services_list/nursing_services_list_view.dart';
import 'package:developer/pages/places_list/pharmacies_list/pharmacies_list_view.dart';
import 'package:developer/pages/places_list/x_ray_list/xray_list_view.dart';
import 'package:developer/widgets/depart_item_widget.dart';
import 'package:get/get.dart';

import '../../services/local_app_api.dart';

class DepartmentLogic extends GetxController {
  RxBool isLoading = false.obs;
  RxList mainItemList = <DepartItemWgt>[].obs;
  @override
  void onReady() {
    ///implement onReady
    fetchList();
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void fetchList() async {
    final listDepsPage = <String>[
      HospitalsListPage.id,
      ClinicsListPage.id,
      NursingServicesListPage.id,
      PharmaciesListPage.id,
      XRayListPage.id,
      LabsListPage.id,
      MedicalSupportListPage.id,
    ];
    try {
      isLoading.value = true;
      List<DepartItemModel> homeItems =
          await LocalAppApi().fetchDepartmentsItems();

      mainItemList.value = <DepartItemWgt>[
        for (int i = 0; i < homeItems.length; i++)
          DepartItemWgt(
            homeItemModel: homeItems[i],
            index: i,
            onPressed: () {
              try {
                Get.toNamed(listDepsPage[i]);
              } on Exception catch (e) {
                Get.toNamed(listDepsPage[0]);
              }
            },
          )
      ];

      /*
      * List<DepartItemWgt>.from(homeItems.map(
        (item) {
          numPostion++;
          return DepartItemWgt(
            homeItemModel: item,
            index: numPostion,
            onPressed: () {
              Get.toNamed(listDepsPage[numPostion]);
            },
          );
        },
      ));*/
    } catch (e) {
      print("error [fetchList] [depart_logic] " + e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
