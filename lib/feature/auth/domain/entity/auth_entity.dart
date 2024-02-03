import 'package:equatable/equatable.dart';


class AuthEntity extends Equatable {
  final String? studentId;
  final String fname;
  final String lname;
  final String phone;
  // final BatchEntity batch;
  // final List<CourseEntity> courses;
  final String username;
  final String password;

  const AuthEntity({
    this.studentId,
    required this.fname,
    required this.lname,
    required this.phone,
    // required this.batch,
    // required this.courses,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [studentId, fname, lname,  phone,username, password];
}
