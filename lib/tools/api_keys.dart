const String kPharmacyPath = 'dep_pharmacies_data.json';
const String kLabsPath = 'dep_labs_data.json';
const String kClinicsPath = 'dep_clinics_data.json';
const String kEmptyPath = 'empty_data.json';
const String kDoctorBookingPath = 'doctor_data.json';
const String kHospitalsTitleKey = "المستشفيات";
const String kServicesListKey = "الخدمات المقدمة";
const String kNursingKey = "خدمات التمريض";
const String kPharmacyTitleKey = "الصيدليات";
const String kDivisionTitleKey = "النوع";
const String kXRayTitleKey = "مراكز الأشعة";
const String kMedicalLabsKey = "التحاليل الطبيه";
const String kMedicalSupportTitleKey = "المساعدات الطبيه";
const String kAccessKey = "access_token";
const String kAutoLoginKey = "auto_login";
const String kprofileInfoKey = "profile_info";
const String kLogInfoKey = "Login_info";
const String kMainLocalDataBaseKey = "mainLocalDB";

/// parent and sub keys list :
const String kUploadFlowValue = "UploadFlow";
const String kRegularFlowValue = "RegularFlow";
const String kParentFlowValue = "ParentFlow";
const String kFlowTypeParamKey = 'flow_type';
const String kSuccessMsgUploadValue = "success";
const String kFailedMsgUploadValue = "failed";
const String kIdProviderKey = "Id_Provider";

const Map<String, String> kDepartmentsApi = {
  kPharmacyTitleKey: kPharmacyPath,
  kServicesListKey: kClinicsPath,
  kMedicalLabsKey: kLabsPath,
  kHospitalsTitleKey: kEmptyPath,
  kNursingKey: kEmptyPath,
  kMedicalSupportTitleKey: kEmptyPath,
  kXRayTitleKey: kEmptyPath,
};
