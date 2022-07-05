import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/data/services/local_data.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user_repository_impl.dart';

class ProfileLogic extends GetxController {
  String userName = "Full Name";
  String phoneNumber = "01111111";

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    final response = await UserRepositoryImpl().profileInfoUser();
    response.fold((l) async {
      ProfileInfoModel profileInfoModel = await LocalData().readProfileInfo();
      userName = profileInfoModel.data!.name.toString();
      phoneNumber = profileInfoModel.data!.phone.toString();
    }, (profileModel) {
      userName = profileModel.data!.name.toString();
      phoneNumber = profileModel.data!.name.toString();
    });

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
