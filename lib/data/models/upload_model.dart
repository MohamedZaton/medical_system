import 'dart:convert';

UploadModel uploadModelFromJson(String str) =>
    UploadModel.fromJson(json.decode(str));
String uploadModelToJson(UploadModel data) => json.encode(data.toJson());

class UploadModel {
  String? reservationDate;
  String? reservationTime;
  String? serviceId;
  String? serviceProviderId;
  String? zoneId;

  UploadModel({
    this.reservationDate,
    this.reservationTime,
    this.serviceId,
    this.serviceProviderId,
    this.zoneId,
  });

  UploadModel.fromJson(dynamic json) {
    reservationDate = json['reservation_date'];
    reservationTime = json['reservation_time'];
    serviceId = json['service_id'];
    serviceProviderId = json['service_provider_id'];
    zoneId = json['zone_id'];
  }

  UploadModel copyWith({
    String? reservationDate,
    String? reservationTime,
    String? serviceId,
    String? serviceProviderId,
    String? zoneId,
  }) =>
      UploadModel(
        reservationDate: reservationDate ?? this.reservationDate,
        reservationTime: reservationTime ?? this.reservationTime,
        serviceId: serviceId ?? this.serviceId,
        serviceProviderId: serviceProviderId ?? this.serviceProviderId,
        zoneId: zoneId ?? this.zoneId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reservation_date'] = reservationDate;
    map['reservation_time'] = reservationTime;
    map['service_id'] = serviceId;
    map['service_provider_id'] = serviceProviderId;
    map['zone_id'] = zoneId;
    return map;
  }
}
