import 'dart:convert';

import 'package:developer/domain/entities/user.dart';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));
String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel extends User {
  String? phone;
  String? password;
  LogInModel({
    this.phone,
    this.password,
  }) : super(phone: phone, password: password);

  factory LogInModel.fromJson(dynamic json) {
    return LogInModel(
      phone: json['phone'],
      password: json['password'],
    );
  }

  LogInModel copyWith({
    String? phone,
    String? password,
  }) =>
      LogInModel(
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}
