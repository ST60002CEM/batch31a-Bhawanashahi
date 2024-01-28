import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final String? image;
  final String email;
  final String password;

  const AuthEntity({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    this.image,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [id, fname, lname,phone, image, email, password];
}
