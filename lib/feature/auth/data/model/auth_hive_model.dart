import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_pet_shop/config/constant/hive_table_constant.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';


part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String studentId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String phone;



  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  // Constructor
  AuthHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    required this.phone,

    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  // // empty constructor
  AuthHiveModel.empty()
      : this(
          studentId: '',
          fname: '',
          lname: '',
          phone: '',
          username: '',
          password: '',
        );

  // Convert Entity to Hive Object
  factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
        fname: entity.fname,
        lname: entity.lname,
        phone: entity.phone,
        username: entity.username,
        password: entity.password,
      );

  // Convert Hive Object to Entity
  static AuthEntity toEntity(AuthHiveModel hiveModel) => AuthEntity(
        studentId: hiveModel.studentId,
        fname: hiveModel.fname,
        lname: hiveModel.lname,
        phone: hiveModel.phone,
        username: hiveModel.username,
        password: hiveModel.password,
      );

  @override
  String toString() {
    return 'studentId: $studentId, fname: $fname, lname: $lname, phone: $phone, username: $username, password: $password';
  }

  @override
  List<Object?> get props => [
        studentId,
        fname,
        lname,
        phone,
        username,
        password,
      ];
}