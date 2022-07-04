import 'dart:convert';

ProfileInfoModel profileInfoModelFromJson(String str) =>
    ProfileInfoModel.fromJson(json.decode(str));
String profileInfoModelToJson(ProfileInfoModel data) =>
    json.encode(data.toJson());

class ProfileInfoModel {
  ProfileInfoModel({
    this.success,
    this.data,
  });

  ProfileInfoModel.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  Data? data;
  ProfileInfoModel copyWith({
    bool? success,
    Data? data,
  }) =>
      ProfileInfoModel(
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
    this.phone,
    this.emailVerifiedAt,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? phone;
  dynamic emailVerifiedAt;
  String? active;
  String? createdAt;
  String? updatedAt;
  Data copyWith({
    int? id,
    String? name,
    String? phone,
    dynamic emailVerifiedAt,
    String? active,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        active: active ?? this.active,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email_verified_at'] = emailVerifiedAt;
    map['active'] = active;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
