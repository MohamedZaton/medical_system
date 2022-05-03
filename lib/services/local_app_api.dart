import 'dart:convert';

import 'package:developer/models/delivery_model.dart';
import 'package:developer/models/depart_item_model.dart';
import 'package:developer/services/app_api.dart';
import 'package:flutter/services.dart';

import '../models/order_model.dart';
import '../tools/api_keys.dart';

class LocalAppApi implements AppApi {
  @override
  Future<List<DepartItemModel>> fetchDepartmentsItems() async {
    String jsonContent =
        await rootBundle.loadString('assets/local_data/department_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<DepartItemModel> items = DepartItemModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<OrderModel>> fetchOrdersItems() async {
    String jsonContent =
        await rootBundle.loadString('assets/local_data/orders_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<OrderModel> items = OrderModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<DeliveryModel>> fetchDeliveriesItems() async {
    String jsonContent =
        await rootBundle.loadString('assets/local_data/delivery_boy_data.json');
    List<dynamic> jsonData = json.decode(jsonContent);
    List<DeliveryModel> items = DeliveryModel.getListObject(jsonData);
    return items;
  }

  @override
  Future<List<DepartItemModel>> fetchSubDepartItems(
      {String fileName = kClinicsPath}) async {
    String jsonContent =
        await rootBundle.loadString('assets/local_data/' + fileName);
    List<dynamic> jsonData = json.decode(jsonContent);
    List<DepartItemModel> items = DepartItemModel.getListObject(jsonData);
    return items;
  }
}
