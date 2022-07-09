import 'dart:convert';

ServicesListModel servicesListModelFromJson(String str) =>
    ServicesListModel.fromJson(json.decode(str));
String servicesListModelToJson(ServicesListModel data) =>
    json.encode(data.toJson());

class ServicesListModel {
  ServicesListModel({
    this.success,
    this.data,
  });

  ServicesListModel.fromJson(dynamic json) {
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
  ServicesListModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      ServicesListModel(
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
    this.price,
    this.image,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? price;
  String? image;
  Data copyWith({
    int? id,
    String? name,
    String? price,
    String? image,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['image'] = image;
    return map;
  }
}
