import 'dart:convert';

CategoryModel parentCategModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));
String parentCategModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    this.success,
    this.data,
  });

  CategoryModel.fromJson(dynamic json) {
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
  CategoryModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      CategoryModel(
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
  int? id;
  String? nameEn;
  String? nameAr;
  String? icon;
  String? needDelivery;
  String? active;
  String? type;
  dynamic parentId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Data({
    this.id,
    this.nameEn,
    this.nameAr,
    this.icon,
    this.needDelivery,
    this.active,
    this.type,
    this.parentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    icon = json['icon'];
    needDelivery = json['need_delivery'];
    active = json['active'];
    type = json['type'];
    parentId = json['parent_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Data copyWith({
    int? id,
    String? nameEn,
    String? nameAr,
    String? icon,
    String? needDelivery,
    String? active,
    String? type,
    dynamic parentId,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) =>
      Data(
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        nameAr: nameAr ?? this.nameAr,
        icon: icon ?? this.icon,
        needDelivery: needDelivery ?? this.needDelivery,
        active: active ?? this.active,
        type: type ?? this.type,
        parentId: parentId ?? this.parentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_en'] = nameEn;
    map['name_ar'] = nameAr;
    map['icon'] = icon;
    map['need_delivery'] = needDelivery;
    map['active'] = active;
    map['type'] = type;
    map['parent_id'] = parentId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    return map;
  }
}
