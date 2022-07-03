import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? phone;
  final String? password;

  User({
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [phone, password];

  @override
  bool get stringify => true;
}
