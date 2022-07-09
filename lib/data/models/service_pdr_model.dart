import 'dart:convert';

ServiceProviderModel serviceProviderModelFromJson(String str) =>
    ServiceProviderModel.fromJson(json.decode(str));
String serviceProviderModelToJson(ServiceProviderModel data) =>
    json.encode(data.toJson());

class ServiceProviderModel {
  ServiceProviderModel({
    this.success,
    this.data,
  });

  ServiceProviderModel.fromJson(dynamic json) {
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
  ServiceProviderModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      ServiceProviderModel(
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
    this.logo,
    this.rate,
    this.flowType,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    rate = json['rate'];
    flowType = json['flow_type'];
  }
  int? id;
  String? name;
  String? logo;
  String? rate;
  String? flowType;
  Data copyWith({
    int? id,
    String? name,
    String? logo,
    String? rate,
    String? flowType,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        logo: logo ?? this.logo,
        rate: rate ?? this.rate,
        flowType: flowType ?? this.flowType,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['logo'] = logo;
    map['rate'] = rate;
    map['flow_type'] = flowType;
    return map;
  }
}
