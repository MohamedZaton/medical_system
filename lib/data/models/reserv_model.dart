import 'dart:convert';

ReservModel reservModelFromJson(String str) =>
    ReservModel.fromJson(json.decode(str));
String reservModelToJson(ReservModel data) => json.encode(data.toJson());

class ReservModel {
  ReservModel({
    this.success,
    this.data,
  });

  ReservModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;
  ReservModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      ReservModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.id,
    this.serviceName,
    this.totalPrice,
    this.status,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    serviceName = json['service_name'];
    totalPrice = json['total_price'];
    status = json['status'];
  }
  int? id;
  String? serviceName;
  int? totalPrice;
  String? status;
  Data copyWith({
    int? id,
    String? serviceName,
    int? totalPrice,
    String? status,
  }) =>
      Data(
        id: id ?? this.id,
        serviceName: serviceName ?? this.serviceName,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_name'] = serviceName;
    map['total_price'] = totalPrice;
    map['status'] = status;
    return map;
  }
}
