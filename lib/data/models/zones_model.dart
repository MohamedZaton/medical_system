import 'dart:convert';

ZonesModel zonesModelFromJson(String str) =>
    ZonesModel.fromJson(json.decode(str));
String zonesModelToJson(ZonesModel data) => json.encode(data.toJson());

class ZonesModel {
  ZonesModel({
    this.success,
    this.data,
  });

  ZonesModel.fromJson(dynamic json) {
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
  ZonesModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      ZonesModel(
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
    this.nameEn,
    this.nameAr,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }
  int? id;
  String? nameEn;
  String? nameAr;
  Data copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
  }) =>
      Data(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    return map;
  }
}
