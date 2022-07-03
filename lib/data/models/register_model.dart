import 'dart:convert';

import '../../domain/entities/user.dart';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel extends User {
  RegisterModel({
    required this.name,
    required this.phone,
    required this.password,
  }) : super(
          phone: phone,
          password: password,
        );

  factory RegisterModel.fromJson(dynamic json) {
    return RegisterModel(
      name: json['name'],
      phone: json['phone'],
      password: json['password'],
    );
  }
  String? name;
  String? phone;
  String? password;
  RegisterModel copyWith({
    String? name,
    String? phone,
    String? password,
  }) =>
      RegisterModel(
        name: name ?? this.name,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
