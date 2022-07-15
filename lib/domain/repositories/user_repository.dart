import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:developer/core/error/failure.dart';
import 'package:developer/data/models/ads_model.dart' as listAds;
import 'package:developer/data/models/deliver_model.dart' as deliverList;
import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/log_in_rp_model.dart';
import 'package:developer/data/models/profile_info_model.dart';
import 'package:developer/data/models/register_model.dart';
import 'package:developer/data/models/register_rp_model.dart';
import 'package:developer/data/models/reserv_model.dart' as reservList;
import 'package:developer/data/models/service_details_model.dart'
    as serviceDetails;
import 'package:developer/data/models/services_list_model.dart' as servicesList;
import 'package:developer/data/models/zones_model.dart' as zoneList;

import '../../data/models/category_model.dart' as categoryList;
import '../../data/models/service_pdr_model.dart' as servicePdrList;
import '../../data/models/upload_model.dart';

abstract class UserRepository {
  Future<Either<Failure, RegisterRpModel>> createNewUser(
      RegisterModel registerModel);
  Future<Either<Failure, LogInRpModel>> loginUser(LogInModel logInModel);
  Future<void> refreshToken();
  Future<Either<Failure, bool>> deletePutReservationOrder(int id);
  Future<Either<Failure, String>> logOutUser();
  Future<Either<Failure, ProfileInfoModel>> profileInfoUser();
  Future<Either<Failure, List<listAds.Data>>> getAdsUser();
  Future<Either<Failure, List<reservList.Data>>> getReservList();
  Future<Either<Failure, List<deliverList.Data>>> getDeliverList();
  Future<Either<Failure, List<categoryList.Data>>> getParentCtgList();
  Future<Either<Failure, List<categoryList.Data>>> getSubCtgList(int id);
  Future<Either<Failure, List<servicesList.Data>>> getServicesList(int id);
  Future<Either<Failure, serviceDetails.Data>> getServiceDetails(int id);
  Future<Either<Failure, bool>> createReservationPaper(
      UploadModel uploadModel, File file);
  Future<Either<Failure, List<servicePdrList.Data>>> getServiceProviderList(
      int id);
  Future<Either<Failure, List<zoneList.Data>>> getZonesList();
}
