import 'dart:io';

import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/register_model.dart';
import 'package:developer/data/models/upload_model.dart';
import 'package:dio/dio.dart';

import '../models/analyses_model.dart';
import '../models/booking_doctor_model.dart';
import '../models/delivery_model.dart';
import '../models/depart_item_model.dart';
import '../models/order_model.dart';

abstract class AppApi {
  /// list of main departments
  Future<List<DepartItemModel>> fetchDepartmentsItems();

  /// list of doctors each departments
  Future<List<BookingDoctorModel>> fetchDoctorBookingItems();

  /// list of sub-departments

  Future<List<DepartItemModel>> fetchSubDepartItems(
      {String fileName = "dep_clinics_data.json"});

  /// list of order log
  Future<List<OrderModel>> fetchOrdersItems();

  Future<List<DeliveryModel>> fetchDeliveriesItems();
  Future<List<AnalysesModel>> fetchAnalysesItems();
  Future<Response> getParentDepartmentRequest();
  Future<Response> getSubDepartmentRequest(int id);

  Future<Response> postRegisterRequest(RegisterModel registerModel);
  Future<Response> postLoginRequest(LogInModel logInModel);
  Future<Response> postUploadFlowRequest(UploadModel uploadModel, File file,
      {bool hasImage = true});
  Future<Response> getLogOutRequest();
  Future<Response> getZonesListRequest();
  Future<Response> getProfileInfoRequest();
  Future<Response> getAdsRequest();
  Future<Response> getAboutsRequest();
  Future<Response> getReservationRequest();
  Future<Response> putReservationRequest(int id);
  Future<Response> getDeleverRequest();
  Future<Response> getFacebookPageRequest();
  Future<Response> getWhatsAppNumbersRequest();
  Future<Response> getServicesListRequest(int id);
  Future<Response> getServiceDetailsRequest(int id);
}
