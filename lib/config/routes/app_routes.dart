import 'package:developer/pages/profile/profile_controller.dart';
import 'package:developer/pages/profile/profile_view.dart';
import 'package:get/get.dart';

import '../../pages/booking_doctor/booking_doctor_logic.dart';
import '../../pages/booking_doctor/booking_doctor_view.dart';
import '../../pages/delivery_page/delivery_logic.dart';
import '../../pages/delivery_page/delivery_view.dart';
import '../../pages/department_page/depart_logic.dart';
import '../../pages/department_page/depart_view.dart';
import '../../pages/doctor_list_page/doctors_list_logic.dart';
import '../../pages/doctor_list_page/doctors_list_view.dart';
import '../../pages/home/home_logic.dart';
import '../../pages/home/home_view.dart';
import '../../pages/medical_form/medical_form_logic.dart';
import '../../pages/medical_form/medical_form_view.dart';
import '../../pages/message/message_logic.dart';
import '../../pages/message/message_view.dart';
import '../../pages/places_list/clinics_list/clinic_list_logic.dart';
import '../../pages/places_list/clinics_list/clinic_list_view.dart';
import '../../pages/places_list/hospitals_list/hospitals_list_logic.dart';
import '../../pages/places_list/hospitals_list/hospitals_list_view.dart';
import '../../pages/places_list/medical_support_list/medical_support_list_logic.dart';
import '../../pages/places_list/medical_support_list/medical_support_list_view.dart';
import '../../pages/places_list/nursing_services_list/nursing_services_list_logic.dart';
import '../../pages/places_list/nursing_services_list/nursing_services_list_view.dart';
import '../../pages/places_list/pharmacies_list/pharmacies_list_logic.dart';
import '../../pages/places_list/pharmacies_list/pharmacies_list_view.dart';
import '../../pages/places_list/x_ray_list/xray_list_logic.dart';
import '../../pages/places_list/x_ray_list/xray_list_view.dart';
import '../../pages/setting_page/setting_logic.dart';
import '../../pages/setting_page/setting_view.dart';
import '../../pages/sign_up_page/sigin_up_logic.dart';
import '../../pages/sign_up_page/sigin_up_view.dart';
import '../../pages/splash/splash_logic.dart';
import '../../pages/splash/splash_view.dart';

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
    ];
  }
}
