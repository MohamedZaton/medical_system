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

import '../../data/models/parent_categ_model.dart' as parentList;

abstract class UserRepository {
  Future<Either<Failure, RegisterRpModel>> createNewUser(
      RegisterModel registerModel);
  Future<Either<Failure, LogInRpModel>> loginUser(LogInModel logInModel);
  Future<void> refreshToken(int? statueCode, Future<dynamic> sameMethod);
  Future<Either<Failure, String>> logOutUser();
  Future<Either<Failure, ProfileInfoModel>> profileInfoUser();
  Future<Either<Failure, List<listAds.Data>>> getAdsUser();
  Future<Either<Failure, List<reservList.Data>>> getReservList();
  Future<Either<Failure, List<deliverList.Data>>> getDeliverList();
  Future<Either<Failure, List<parentList.Data>>> getParentCtgList();
}
