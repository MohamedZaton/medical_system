import 'dart:convert';
import 'dart:io';

import 'package:developer/data/models/analyses_model.dart';
import 'package:developer/data/models/booking_doctor_model.dart';
import 'package:developer/data/models/delivery_model.dart';
import 'package:developer/data/models/depart_item_model.dart';
import 'package:developer/data/models/log_in_model.dart';
import 'package:developer/data/models/register_model.dart';
import 'package:developer/data/models/upload_model.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/services.dart';

import '../../tools/api_keys.dart';
import '../models/order_model.dart';
import 'app_api.dart';

class LocalAppApi implements AppApi {
  final String localServer = 'assets/local_data/';
  @override
  Future<List<DepartItemModel>> fetchDepartmentsItems() async {
    String jsonContent =
        await rootBundle.loadString(localServer + 'department_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<DepartItemModel> items = DepartItemModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<OrderModel>> fetchOrdersItems() async {
    String jsonContent =
        await rootBundle.loadString(localServer + 'orders_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<OrderModel> items = OrderModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<AnalysesModel>> fetchAnalysesItems() async {
    String jsonContent =
        await rootBundle.loadString(localServer + 'analyses_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<AnalysesModel> items = AnalysesModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<DeliveryModel>> fetchDeliveriesItems() async {
    String jsonContent =
        await rootBundle.loadString(localServer + 'delivery_boy_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<DeliveryModel> items = DeliveryModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<DepartItemModel>> fetchSubDepartItems(
      {String fileName = kClinicsPath}) async {
    String jsonContent = await rootBundle.loadString(localServer + fileName);
    List<dynamic> jsonData = json.decode(jsonContent);
    List<DepartItemModel> items = DepartItemModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<BookingDoctorModel>> fetchDoctorBookingItems() async {
    String jsonContent =
        await rootBundle.loadString(localServer + kDoctorBookingPath);
    List<dynamic> jsonData = json.decode(jsonContent);
    List<BookingDoctorModel> items = BookingDoctorModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<Response> postRegisterRequest(RegisterModel registerModel) {
    throw UnimplementedError();
  }

  @override
  Future<Response> postLoginRequest(LogInModel logInModel) {
    throw UnimplementedError();
  }

  @override
  Future<Response> getLogOutRequest() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getProfileInfoRequest() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getAdsRequest() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getReservationRequest() {
    // TODO: implement getReservationRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getDeleverRequest() {
    // TODO: implement getDeleverRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getFacebookPageRequest() {
    // TODO: implement getFacebookPageRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getWhatsAppNumbersRequest() {
    // TODO: implement getWhatsAppNumbersRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getParentDepartmentRequest() {
    // TODO: implement fetchParentDepartmentRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getSubDepartmentRequest(int id) {
    // TODO: implement getSubDepartmentRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> postUploadFlowRequest(UploadModel uploadModel, File file,
      {bool hasImage = true}) {
    // TODO: implement postUploadFlowRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> putReservationRequest(int id) {
    // TODO: implement putReservationRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getServiceDetailsRequest(int id) {
    // TODO: implement getServiceDetailsRequest
    throw UnimplementedError();
  }

  @override
  Future<Response> getServicesListRequest(int id) {
    // TODO: implement getServicesListRequest
    throw UnimplementedError();
  }
}
