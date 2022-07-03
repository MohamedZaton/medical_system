import 'package:developer/presentation/pages/divisions/division_view.dart';
import 'package:developer/presentation/pages/divisions/divisions_logic.dart';
import 'package:developer/presentation/pages/labs_medical_department/lab_sections/lab_sections_logic.dart';
import 'package:developer/presentation/pages/places_list/labs_list/labs_list_logic.dart';
import 'package:developer/presentation/pages/places_list/labs_list/labs_list_view.dart';
import 'package:developer/presentation/pages/profile/profile_controller.dart';
import 'package:developer/presentation/pages/profile/profile_view.dart';
import 'package:get/get.dart';

import '../../presentation/pages/booking_doctor/booking_doctor_logic.dart';
import '../../presentation/pages/booking_doctor/booking_doctor_view.dart';
import '../../presentation/pages/delivery_page/delivery_logic.dart';
import '../../presentation/pages/delivery_page/delivery_view.dart';
import '../../presentation/pages/department_page/depart_logic.dart';
import '../../presentation/pages/department_page/depart_view.dart';
import '../../presentation/pages/doctor_list_page/doctors_list_logic.dart';
import '../../presentation/pages/doctor_list_page/doctors_list_view.dart';
import '../../presentation/pages/home/home_logic.dart';
import '../../presentation/pages/home/home_view.dart';
import '../../presentation/pages/labs_medical_department/lab_sections/lab_sections_view.dart';
import '../../presentation/pages/labs_medical_department/labs_booking/labs_booking_logic.dart';
import '../../presentation/pages/labs_medical_department/labs_booking/labs_booking_view.dart';
import '../../presentation/pages/labs_medical_department/medical_analyses_list/medical_analyses_list_logic.dart';
import '../../presentation/pages/labs_medical_department/medical_analyses_list/medical_analyses_list_view.dart';
import '../../presentation/pages/medical_form/medical_form_logic.dart';
import '../../presentation/pages/medical_form/medical_form_view.dart';
import '../../presentation/pages/message/message_logic.dart';
import '../../presentation/pages/message/message_view.dart';
import '../../presentation/pages/places_list/clinics_list/clinic_list_logic.dart';
import '../../presentation/pages/places_list/clinics_list/clinic_list_view.dart';
import '../../presentation/pages/places_list/hospitals_list/hospitals_list_logic.dart';
import '../../presentation/pages/places_list/hospitals_list/hospitals_list_view.dart';
import '../../presentation/pages/places_list/medical_support_list/medical_support_list_logic.dart';
import '../../presentation/pages/places_list/medical_support_list/medical_support_list_view.dart';
import '../../presentation/pages/places_list/nursing_services_list/nursing_services_list_logic.dart';
import '../../presentation/pages/places_list/nursing_services_list/nursing_services_list_view.dart';
import '../../presentation/pages/places_list/pharmacies_list/pharmacies_list_logic.dart';
import '../../presentation/pages/places_list/pharmacies_list/pharmacies_list_view.dart';
import '../../presentation/pages/places_list/x_ray_list/xray_list_logic.dart';
import '../../presentation/pages/places_list/x_ray_list/xray_list_view.dart';
import '../../presentation/pages/setting_page/setting_logic.dart';
import '../../presentation/pages/setting_page/setting_view.dart';
import '../../presentation/pages/sign_up_page/sigin_up_logic.dart';
import '../../presentation/pages/sign_up_page/sigin_up_view.dart';
import '../../presentation/pages/splash/splash_logic.dart';
import '../../presentation/pages/splash/splash_view.dart';

class AppRoutes {
  static List<GetPage<dynamic>>? onGenerateRoutes() {
    return [
      GetPage(
        name: HomePage.id,
        page: () => HomePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HomeLogic>(() => HomeLogic());
        }),
      ),
      GetPage(
        name: SplashPage.id,
        page: () => SplashPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SplashLogic>(() => SplashLogic());
        }),
      ),
      GetPage(
        name: SignUpPage.id,
        page: () => SignUpPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SignUpLogic>(() => SignUpLogic());
        }),
      ),
      GetPage(
        name: SettingPage.id,
        page: () => SettingPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<SettingLogic>(() => SettingLogic());
        }),
      ),
      GetPage(
        name: DepartmentPage.id,
        page: () => DepartmentPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<DepartmentLogic>(() => DepartmentLogic());
        }),
      ),
      GetPage(
        name: DeliveryPage.id,
        page: () => DeliveryPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<DeliveryLogic>(() => DeliveryLogic());
        }),
      ),
      GetPage(
        name: MedicalFormPage.id,
        page: () => MedicalFormPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<MedicalFormLogic>(() => MedicalFormLogic());
        }),
      ),
      GetPage(
        name: DoctorListPage.id,
        page: () => DoctorListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<DoctorsListLogic>(() => DoctorsListLogic());
          Get.lazyPut<DivisionsLogic>(() => DivisionsLogic());
          Get.lazyPut<BookingDoctorLogic>(() => BookingDoctorLogic());
        }),
      ),
      GetPage(
        name: BookingDoctorPage.id,
        page: () => BookingDoctorPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<BookingDoctorLogic>(() => BookingDoctorLogic());
        }),
      ),
      GetPage(
        name: HospitalsListPage.id,
        page: () => HospitalsListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<HospitalsListLogic>(() => HospitalsListLogic());
        }),
      ),
      GetPage(
        name: ClinicsListPage.id,
        page: () => ClinicsListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ClinicsListLogic>(() => ClinicsListLogic());
          Get.lazyPut<DivisionsLogic>(() => DivisionsLogic());
        }),
      ),
      GetPage(
        name: MedicalSupportListPage.id,
        page: () => MedicalSupportListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<MedicalSupportListLogic>(() => MedicalSupportListLogic());
        }),
      ),
      GetPage(
        name: NursingServicesListPage.id,
        page: () => NursingServicesListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<NursingServicesListLogic>(
              () => NursingServicesListLogic());
        }),
      ),
      GetPage(
        name: PharmaciesListPage.id,
        page: () => PharmaciesListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<PharmaciesListLogic>(() => PharmaciesListLogic());
        }),
      ),
      GetPage(
        name: LabsListPage.id,
        page: () => LabsListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LabsListLogic>(() => LabsListLogic());
          Get.lazyPut<LabSectionsLogic>(() => LabSectionsLogic());
        }),
      ),
      GetPage(
        name: XRayListPage.id,
        page: () => XRayListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<XRayListLogic>(() => XRayListLogic());
        }),
      ),
      GetPage(
        name: MessagePage.id,
        page: () => MessagePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<MessageLogic>(() => MessageLogic());
        }),
      ),
      GetPage(
        name: ProfilePage.id,
        page: () => ProfilePage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<ProfileLogic>(() => ProfileLogic());
        }),
      ),
      GetPage(
        name: DivisionsPage.id,
        page: () => DivisionsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<DivisionsLogic>(() => DivisionsLogic());
        }),
      ),
      GetPage(
        name: LabSectionsPage.id,
        page: () => LabSectionsPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LabSectionsLogic>(() => LabSectionsLogic());
        }),
      ),
      GetPage(
        name: LabsBookingPage.id,
        page: () => LabsBookingPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<LabsBookingLogic>(() => LabsBookingLogic());
        }),
      ),
      GetPage(
        name: MedicalAnalysesListPage.id,
        page: () => MedicalAnalysesListPage(),
        binding: BindingsBuilder(() {
          Get.lazyPut<MedicalAnalysesListLogic>(
              () => MedicalAnalysesListLogic());
        }),
      ),
    ];
  }
}
