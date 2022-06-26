import 'dart:convert';

import 'package:developer/models/booking_doctor_model.dart';
import 'package:developer/models/delivery_model.dart';
import 'package:developer/models/depart_item_model.dart';
import 'package:developer/services/app_api.dart';
import 'package:flutter/services.dart';

import '../models/order_model.dart';
import '../tools/api_keys.dart';

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
}
