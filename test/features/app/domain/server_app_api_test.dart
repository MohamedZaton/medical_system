import 'package:developer/data/models/ads_model.dart';
import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/log_in_rp_model.dart';
import 'package:developer/data/models/register_model.dart';
import 'package:developer/data/services/server_app_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  group("register  request ", () {
    test(" post request", () async {
      Response response = await ServerAppApi().postRegisterRequest(
        RegisterModel(
          name: 'Ahmed b',
          phone: '0125873396',
          password: '111222333',
        ),
      );
      expect(response.statusCode, 200);
    });
  });

  group("login user  request ", () {
    test(" get request", () async {
      Response response = await ServerAppApi().postLoginRequest(
        LogInModel(
          phone: '01222873396',
          password: '111222333',
        ),
      );

      LogInRpModel logInRpModel = LogInRpModel.fromJson(response.data);
      expect(logInRpModel.accessToken?.isNotEmpty, true);
    });
  });
  group("logOut user  request ", () {
    test(" get request", () async {
      Response response = await ServerAppApi().getLogOutRequest();
      String message = response.data["message"];
      expect(message.isNotEmpty, true);
    });
  });
  group("ads List  request ", () {
    test(" get request", () async {
      await GetStorage.init();

      Response response = await ServerAppApi().getAdsRequest();
      AdsModel adsModel = AdsModel.fromJson(response.data);
      expect(adsModel.data?.length, greaterThanOrEqualTo(1));
    });
  });
}
