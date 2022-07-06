import 'dart:convert';

UploadModel uploadModelFromJson(String str) =>
    UploadModel.fromJson(json.decode(str));
String uploadModelToJson(UploadModel data) => json.encode(data.toJson());

class UploadModel {
  UploadModel({
    this.reservationDate,
    this.reservationTime,
    this.serviceId,
    this.zoneId,
  });

  UploadModel.fromJson(dynamic json) {
    reservationDate = json['reservation_date'];
    reservationTime = json['reservation_time'];
    serviceId = json['service_id'];
    zoneId = json['zone_id'];
  }
  String? reservationDate;
  String? reservationTime;
  String? serviceId;
  String? zoneId;
  UploadModel copyWith({
    String? reservationDate,
    String? reservationTime,
    String? serviceId,
    String? zoneId,
  }) =>
      UploadModel(
        reservationDate: reservationDate ?? this.reservationDate,
        reservationTime: reservationTime ?? this.reservationTime,
        serviceId: serviceId ?? this.serviceId,
        zoneId: zoneId ?? this.zoneId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reservation_date'] = reservationDate;
    map['reservation_time'] = reservationTime;
    map['service_id'] = serviceId;
    map['zone_id'] = zoneId;
    return map;
  }
}
