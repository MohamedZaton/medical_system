import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/data/services/local_data.dart';
import 'package:get/get.dart';

class ProfileLogic extends GetxController {
  String userName = "Full Name";
  String phoneNumber = "01111111";

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  void fetchUserInfo() {
    ProfileInfoModel profileInfoModel = LocalData().readProfileInfo();
    userName = profileInfoModel.data!.name.toString();
    phoneNumber = profileInfoModel.data!.phone.toString();
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
