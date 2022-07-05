import 'dart:convert';

import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/tools/api_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  /// token
  Future<void> writeAccessToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kAccessKey, token);
  }

  Future<void> clearAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(kAccessKey);
  }

  Future<String> readAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(kAccessKey).toString();
  }

  /// Auto Login
  Future<void> writeAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(kAutoLoginKey, true);
  }

  Future<bool> readAcceptAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kAutoLoginKey) ?? false;
  }

  Future<void> writeRejectAutoLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(kAutoLoginKey, false);
  }

  /// profile info
  Future<void> writeProfileInfo(ProfileInfoModel profileInfoModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(kprofileInfoKey, jsonEncode(profileInfoModel));
  }

  Future<ProfileInfoModel> readProfileInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString(kprofileInfoKey).toString());

    return ProfileInfoModel.fromJson(json);
  }

  /// Login password & phone
  Future<void> writeLogin(LogInModel logInModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(kLogInfoKey, jsonEncode(logInModel));
  }

  Future<LogInModel> readLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map json = jsonDecode(prefs.getString(kLogInfoKey).toString());

    return LogInModel.fromJson(json);
  }
}
