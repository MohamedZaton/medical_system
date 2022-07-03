import 'dart:convert';

DeliverModel deliverModelFromJson(String str) =>
    DeliverModel.fromJson(json.decode(str));
String deliverModelToJson(DeliverModel data) => json.encode(data.toJson());

class DeliverModel {
  DeliverModel({
    this.success,
    this.data,
  });

  DeliverModel.fromJson(dynamic json) {
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
  DeliverModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      DeliverModel(
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
    this.name,
    this.phone,
    this.zoneName,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    zoneName = json['zone_name'];
  }
  int? id;
  String? name;
  String? phone;
  String? zoneName;
  Data copyWith({
    int? id,
    String? name,
    String? phone,
    String? zoneName,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        zoneName: zoneName ?? this.zoneName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['zone_name'] = zoneName;
    return map;
  }
}
