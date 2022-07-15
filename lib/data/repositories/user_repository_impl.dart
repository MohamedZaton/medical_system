import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:developer/core/network/network_info.dart';
import 'package:developer/data/models/ads_model.dart';
import 'package:developer/data/models/ads_model.dart' as listAds;
import 'package:developer/data/models/deliver_model.dart';
import 'package:developer/data/models/deliver_model.dart' as deliverList;
import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/data/models/reserv_model.dart';
import 'package:developer/data/models/reserv_model.dart' as reservList;
import 'package:developer/data/models/service_details_model.dart';
import 'package:developer/data/models/service_details_model.dart'
    as serviceDetails;
import 'package:developer/data/models/services_list_model.dart' as servicesList;
import 'package:developer/data/models/upload_model.dart';
import 'package:developer/data/models/zones_model.dart';
import 'package:developer/data/models/zones_model.dart' as zoneList;
import 'package:developer/data/services/server_app_api.dart';
import 'package:developer/tools/api_keys.dart';
import 'package:dio/dio.dart';

import '../../core/error/failure.dart';
import '../../data/models/category_model.dart' as categoryList;
import '../../data/models/service_pdr_model.dart' as servicePdrList;
import '../../domain/repositories/user_repository.dart';
import '../../tools/constants.dart';
import '../models/category_model.dart';
import '../models/log_in_model.dart';
import '../models/log_in_rp_model.dart';
import '../models/register_model.dart';
import '../models/register_rp_model.dart';
import '../models/service_pdr_model.dart';
import '../models/services_list_model.dart';
import '../services/local_data.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, RegisterRpModel>> createNewUser(
      RegisterModel registerModel) async {
    Response response = await ServerAppApi().postRegisterRequest(registerModel);
    LocalData().writeAutoLogin();
    LocalData().writeLogin(LogInModel(
        phone: registerModel.phone, password: registerModel.password));
    try {
      RegisterRpModel responseModel = RegisterRpModel.fromJson(response.data);
      String _token = responseModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);

      print("token : " + _token);
      return right(responseModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, LogInRpModel>> loginUser(LogInModel logInModel) async {
    Response response = await ServerAppApi().postLoginRequest(logInModel);
    try {
      LogInRpModel logInRpModel = LogInRpModel.fromJson(response.data);
      String _token = logInRpModel.accessToken.toString();

      /// save token
      LocalData().writeAccessToken(_token);
      LocalData().writeAutoLogin();
      LocalData().writeLogin(logInModel);

      print("token : " + _token);
      return right(logInRpModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, String>> logOutUser() async {
    LocalData().clearAccessToken();
    LocalData().writeRejectAutoLogin();
    Response response = await ServerAppApi().getLogOutRequest();
    try {
      String message = response.data['message'];

      return right(message);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, ProfileInfoModel>> profileInfoUser() async {
    Response response = await ServerAppApi().getProfileInfoRequest();
    try {
      ProfileInfoModel profileInfoModel =
          ProfileInfoModel.fromJson(response.data);
      LocalData().writeProfileInfo(profileInfoModel);

      return right(profileInfoModel);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  /// refresh token
  @override
  Future<void> refreshToken() async {
    LogInModel logInModel = await LocalData().readLogin();

    Response response = await ServerAppApi().postLoginRequest(logInModel);
    LogInRpModel logInRpModel = LogInRpModel.fromJson(response.data);
    String _token = logInRpModel.accessToken.toString();

    /// save token
    LocalData().writeAccessToken(_token);
  }

  @override
  Future<Either<Failure, List<listAds.Data>>> getAdsUser() async {
    Response response = await ServerAppApi().getAdsRequest();
    try {
      AdsModel adsModel = AdsModel.fromJson(response.data);
      List<listAds.Data>? adsList = adsModel.data;

      return right(adsList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<reservList.Data>>> getReservList() async {
    Response response = await ServerAppApi().getReservationRequest();

    try {
      ReservModel reservModel = ReservModel.fromJson(response.data);
      List<reservList.Data>? resList = reservModel.data;

      return right(resList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<zoneList.Data>>> getZonesList() async {
    Response response = await ServerAppApi().getZonesListRequest();

    try {
      ZonesModel zonesModel = ZonesModel.fromJson(response.data);
      List<zoneList.Data>? zoneMenu = zonesModel.data;

      return right(zoneMenu!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<deliverList.Data>>> getDeliverList() async {
    Response response = await ServerAppApi().getDeleverRequest();

    try {
      DeliverModel deliverModel = DeliverModel.fromJson(response.data);
      List<deliverList.Data>? resList = deliverModel.data;

      return right(resList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<categoryList.Data>>> getParentCtgList() async {
    Response response = await ServerAppApi().getParentDepartmentRequest();

    try {
      CategoryModel parentCategModel = CategoryModel.fromJson(response.data);
      List<categoryList.Data>? resList = parentCategModel.data;
      return right(resList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<categoryList.Data>>> getSubCtgList(int id) async {
    Response response = await ServerAppApi().getSubDepartmentRequest(id);

    try {
      CategoryModel subCategModel = CategoryModel.fromJson(response.data);
      List<categoryList.Data>? resList = subCategModel.data;
      return right(resList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, serviceDetails.Data>> getServiceDetails(
      int? id) async {
    Response response = await ServerAppApi().getServiceDetailsRequest(id!);

    try {
      ServiceDetailsModel serviceDetailsModel =
          ServiceDetailsModel.fromJson(response.data);
      serviceDetails.Data? servData = serviceDetailsModel.data;

      return right(servData!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<servicesList.Data>>> getServicesList(
      int? id) async {
    Response response = await ServerAppApi().getServicesListRequest(id!);

    try {
      ServicesListModel servicesListModel =
          ServicesListModel.fromJson(response.data);
      List<servicesList.Data>? servList = servicesListModel.data;
      return right(servList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, List<servicePdrList.Data>>> getServiceProviderList(
      int? id) async {
    Response response = await ServerAppApi().getSubDepartmentRequest(id!);

    try {
      ServiceProviderModel serviceProviderModel =
          ServiceProviderModel.fromJson(response.data);
      List<servicePdrList.Data>? serviceList = serviceProviderModel.data;
      return right(serviceList!);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> createReservationPaper(
      UploadModel uploadModel, File file,
      {bool hasImage = true}) async {
    Response response = await ServerAppApi()
        .postUploadFlowRequest(uploadModel, file, hasImage: hasImage);

    try {
      bool isSuccess = response.data[kSuccessMsgUploadValue] ?? false;
      return right(isSuccess);
    } catch (e) {
      bool isConnect = await NetworkInfoImpl().isConnected;

      return left(Failure(
        isConnect ? kNoNetworkTxt : "${e.toString()}",
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePutReservationOrder(int id) async {
    Response response = await ServerAppApi().putReservationRequest(id);

    try {
      bool isSuccess = response.data[kSuccessMsgUploadValue] ?? false;

      return right(isSuccess);
    } catch (e) {
      String messageFailure = await errorMessage(response);
      return left(Failure(
        messageFailure,
      ));
    }
  }

  Future<String> errorMessage(Response response) async {
    bool isConnect = await NetworkInfoImpl().isConnected;
    String msg = response.statusMessage ?? "";
    if (!isConnect) {
      msg = kNoNetworkTxt;
      return msg;
    }
    switch (response.statusCode) {
      case 500:
        {
          msg = kNoServerTxt;
          break;
        }
      case 401:
        {
          msg = kWrongPwdOrPhoneTxt;
          break;
        }
      case 403:
        {
          msg = kWrongPwdOrPhoneTxt;
          break;
        }
    }

    return msg;
  }
}
