import 'dart:convert';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));
String adsModelToJson(AdsModel data) => json.encode(data.toJson());

class AdsModel {
  bool? success;
  List<Data>? data;
  AdsModel({
    this.success,
    this.data,
  });

  AdsModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  AdsModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      AdsModel(
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
    this.image,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  int? id;
  String? image;
  Data copyWith({
    int? id,
    String? image,
  }) =>
      Data(
        id: id ?? this.id,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }
}
