import 'dart:convert';

LogInRpModel logInRpModelFromJson(String str) =>
    LogInRpModel.fromJson(json.decode(str));
String logInRpModelToJson(LogInRpModel data) => json.encode(data.toJson());

class LogInRpModel {
  LogInRpModel({
    this.accessToken,
    this.tokenType,
    this.data,
  });

  LogInRpModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? accessToken;
  String? tokenType;
  Data? data;
  LogInRpModel copyWith({
    String? accessToken,
    String? tokenType,
    Data? data,
  }) =>
      LogInRpModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        data: data ?? this.data,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
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
