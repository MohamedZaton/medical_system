import 'dart:convert';

ServiceDetailsModel serviceDetailsModelFromJson(String str) =>
    ServiceDetailsModel.fromJson(json.decode(str));
String serviceDetailsModelToJson(ServiceDetailsModel data) =>
    json.encode(data.toJson());

class ServiceDetailsModel {
  ServiceDetailsModel({
    this.success,
    this.data,
  });

  ServiceDetailsModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;
  ServiceDetailsModel copyWith({
    bool? success,
    Data? data,
  }) =>
      ServiceDetailsModel(
        success: success ?? this.success,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
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
    this.price,
    this.serviceProviderId,
    this.serviceProviderName,
    this.serviceProviderLogo,
    this.serviceProviderRate,
    this.openAt,
    this.closedAt,
    this.details,
    this.zone,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    serviceProviderId = json['service_provider_id'];
    serviceProviderName = json['service_provider_name'];
    serviceProviderLogo = json['service_provider_logo'];
    serviceProviderRate = json['service_provider_rate'];
    openAt = json['open_at'];
    closedAt = json['closed_at'];
    details = json['details'];
    zone = json['zone'];
  }
  int? id;
  String? name;
  String? price;
  int? serviceProviderId;
  String? serviceProviderName;
  String? serviceProviderLogo;
  String? serviceProviderRate;
  dynamic openAt;
  dynamic closedAt;
  dynamic details;
  String? zone;
  Data copyWith({
    int? id,
    String? name,
    String? price,
    int? serviceProviderId,
    String? serviceProviderName,
    String? serviceProviderLogo,
    String? serviceProviderRate,
    dynamic openAt,
    dynamic closedAt,
    dynamic details,
    String? zone,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        serviceProviderId: serviceProviderId ?? this.serviceProviderId,
        serviceProviderName: serviceProviderName ?? this.serviceProviderName,
        serviceProviderLogo: serviceProviderLogo ?? this.serviceProviderLogo,
        serviceProviderRate: serviceProviderRate ?? this.serviceProviderRate,
        openAt: openAt ?? this.openAt,
        closedAt: closedAt ?? this.closedAt,
        details: details ?? this.details,
        zone: zone ?? this.zone,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['service_provider_id'] = serviceProviderId;
    map['service_provider_name'] = serviceProviderName;
    map['service_provider_logo'] = serviceProviderLogo;
    map['service_provider_rate'] = serviceProviderRate;
    map['open_at'] = openAt;
    map['closed_at'] = closedAt;
    map['details'] = details;
    map['zone'] = zone;
    return map;
  }
}
