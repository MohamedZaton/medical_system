import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/tools/api_keys.dart';
import 'package:get_storage/get_storage.dart';

class LocalData {
  final box = GetStorage();

  /// token
  void writeAccessToken(String token) {
    box.write(kAccessKey, token);
  }

  void clearAccessToken() {
    box.write(kAccessKey, "");
  }

  bool isClearAccessToken() {
    return box.read(kAccessKey) == "";
  }

  String readAccessToken() {
    return box.read(kAccessKey);
  }

  /// Auto Login
  void writeAutoLogin() {
    box.write(kAutoLoginKey, true);
  }

  bool readAutoLogin() {
    return box.read(kAutoLoginKey) ?? false;
  }

  void deleteAutoLogin() {
    box.write(kAutoLoginKey, false);
  }

  /// profile info
  void writeProfileInfo(ProfileInfoModel profileInfoModel) {
    box.write(kprofileInfoKey, profileInfoModel);
  }

  ProfileInfoModel readProfileInfo() {
    return ProfileInfoModel.fromJson(box.read(kprofileInfoKey));
  }

  /// Login password & phone
  void writeLogin(LogInModel logInModel) {
    box.write(kLogInfoKey, logInModel);
  }

  LogInModel readLogin() {
    return LogInModel.fromJson(box.read(kLogInfoKey));
  }
}
