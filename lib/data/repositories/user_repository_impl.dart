import 'package:dartz/dartz.dart';
import 'package:developer/data/models/ads_model.dart';
import 'package:developer/data/models/ads_model.dart' as listAds;
import 'package:developer/data/models/deliver_model.dart';
import 'package:developer/data/models/deliver_model.dart' as deliverList;
import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/data/models/reserv_model.dart';
import 'package:developer/data/models/reserv_model.dart' as reservList;
import 'package:developer/data/services/server_app_api.dart';

import '../../core/error/failure.dart';
import '../../data/models/parent_categ_model.dart' as parentList;
import '../../domain/repositories/user_repository.dart';
import '../models/log_in_model.dart';
import '../models/log_in_rp_model.dart';
import '../models/parent_categ_model.dart';
import '../models/register_model.dart';
import '../models/register_rp_model.dart';
import '../services/local_data.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, RegisterRpModel>> createNewUser(
      RegisterModel registerModel) async {
    try {
      final response = await ServerAppApi().postRegisterRequest(registerModel);
      RegisterRpModel responseModel = RegisterRpModel.fromJson(response.data);
      String _token = responseModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);
      LocalData().writeAutoLogin();

      print("token : " + _token);
      return right(responseModel);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LogInRpModel>> loginUser(LogInModel logInModel) async {
    try {
      final response = await ServerAppApi().postLoginRequest(logInModel);
      LogInRpModel logInRpModel = LogInRpModel.fromJson(response.data);
      String _token = logInRpModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);
      LocalData().writeAutoLogin();

      print("token : " + _token);
      return right(logInRpModel);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> logOutUser() async {
    try {
      LocalData().clearAccessToken();
      LocalData().writeRejectAutoLogin();
      final response = await ServerAppApi().getLogOutRequest();
      String message = response.data['message'];

      return right(message);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileInfoModel>> profileInfoUser() async {
    dynamic response;

    try {
      response = await ServerAppApi().getProfileInfoRequest();
      ProfileInfoModel profileInfoModel =
          ProfileInfoModel.fromJson(response.data);
      LocalData().writeProfileInfo(profileInfoModel);

      return right(profileInfoModel);
    } catch (e) {
      // refreshToken(response.statusCode, getAdsUser());

      return left(Failure(e.toString()));
    }
  }

  /// refresh token
  @override
  Future<void> refreshToken(int? statueCode, Future sameMethod) async {
    LogInModel logInModel = await LocalData().readLogin();
    if (statueCode == 401 || statueCode == 403) {
      final response = await ServerAppApi().postLoginRequest(logInModel);
      LogInRpModel logInRpModel = LogInRpModel.fromJson(response.data);
      String _token = logInRpModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);

      await sameMethod;
    }
  }

  @override
  Future<Either<Failure, List<listAds.Data>>> getAdsUser() async {
    dynamic response;

    try {
      response = await ServerAppApi().getAdsRequest();
      AdsModel adsModel = AdsModel.fromJson(response.data);
      List<listAds.Data>? adsList = adsModel.data;

      return right(adsList!);
    } catch (e) {
      // refreshToken(response.statusCode, getAdsUser());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<reservList.Data>>> getReservList() async {
    dynamic response;

    try {
      response = await ServerAppApi().getReservationRequest();

      ReservModel reservModel = ReservModel.fromJson(response.data);
      List<reservList.Data>? resList = reservModel.data;

      return right(resList!);
    } catch (e) {
      // refreshToken(response.statusCode, getReservList());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<deliverList.Data>>> getDeliverList() async {
    dynamic response;

    try {
      response = await ServerAppApi().getDeleverRequest();

      DeliverModel deliverModel = DeliverModel.fromJson(response.data);
      List<deliverList.Data>? resList = deliverModel.data;

      return right(resList!);
    } catch (e) {
      // refreshToken(response.statusCode, getDeliverList());

      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<parentList.Data>>> getParentCtgList() async {
    try {
      final response = await ServerAppApi().getParentDepartmentRequest();
      ParentCategModel parentCategModel =
          ParentCategModel.fromJson(response.data);
      List<parentList.Data>? resList = parentCategModel.data;
      return right(resList!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
