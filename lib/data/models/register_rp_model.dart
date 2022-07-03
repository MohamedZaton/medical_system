import 'dart:convert';

RegisterRpModel registerRpModelFromJson(String str) =>
    RegisterRpModel.fromJson(json.decode(str));
String registerRpModelToJson(RegisterRpModel data) =>
    json.encode(data.toJson());

class RegisterRpModel {
  RegisterRpModel({
    this.accessToken,
    this.tokenType,
    this.data,
  });

  RegisterRpModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? accessToken;
  String? tokenType;
  Data? data;
  RegisterRpModel copyWith({
    String? accessToken,
    String? tokenType,
    Data? data,
  }) =>
      RegisterRpModel(
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
    this.name,
    this.phone,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data.fromJson(dynamic json) {
    name = json['name'];
    phone = json['phone'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? phone;
  String? updatedAt;
  String? createdAt;
  int? id;
  Data copyWith({
    String? name,
    String? phone,
    String? updatedAt,
    String? createdAt,
    int? id,
  }) =>
      Data(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }
}
