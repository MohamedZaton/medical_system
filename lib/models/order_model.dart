import 'dart:ui';

import 'package:developer/tools/constants.dart';
import 'package:flutter/material.dart';

enum Status { completed, canceled, waiting, delivering }

class OrderModel {
  int? price;
  String? type;
  String? state;
  Color? stateColor;
  OrderModel({this.price, this.type, this.state, this.stateColor});

  OrderModel.fromJson(Map<String, dynamic> json) {
    price = json['Price'];
    type = json['Type'];
    state = getStatueText(json['state']);
    stateColor = getStatueColor(json['state']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Price'] = this.price;
    data['Type'] = this.type;
    data['state'] = this.state;
    return data;
  }

  static List<OrderModel> getListObject(List<dynamic> jsonBody) {
    List<OrderModel> itemsList =
        List<OrderModel>.from(jsonBody.map((val) => OrderModel.fromJson(val)));
    return itemsList;
  }

  String getStatueText(String state) {
    /// convert String to enum
    Status statusSelected = Status.values.byName(state);

    /// get text which write according language
    Map<Status, String> statusCodes = {
      Status.completed: kCompleted,
      Status.canceled: kCancel,
      Status.waiting: kWaiting,
      Status.delivering: kDelivery,
    };
    return statusCodes[statusSelected] ?? kWaiting;
  }

  Color getStatueColor(String state) {
    /// convert String to enum
    Status statusSelected = Status.values.byName(state);

    /// get color which write according statues
    Map<Status, Color> statusCodes = {
      Status.completed: Colors.green,
      Status.canceled: Colors.red,
      Status.waiting: Colors.grey,
      Status.delivering: Colors.orangeAccent,
    };
    return statusCodes[statusSelected] ?? Colors.grey;
  }
}
