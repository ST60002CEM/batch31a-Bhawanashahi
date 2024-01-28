import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constant/hive_table_constant.dart';
import '../../domain/entity/auth_entity.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String fname;
  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String phone;

  @HiveField(4)
  final String email;

  @HiveField(5)
  final String password;


  // empty constructor
  AuthHiveModel.empty() : this(id: '', fname: '', lname:'',phone:'', email:'', password:'');

  AuthHiveModel({
    String? id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.email,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  // Convert Hive Object to Entity
  static AuthEntity toEntity(AuthHiveModel hiveModel) =>AuthEntity(
        id: hiveModel.id,
        fname: hiveModel.fname,
       lname: hiveModel.lname,
       phone: hiveModel.phone,
    email: hiveModel.email,
    password: hiveModel.password,
      );

  // Convert Entity to Hive Object
  factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
        id: entity.id,
    fname: entity.fname,
    lname: entity.lname,
    phone: entity.phone,
    email: entity.email,
    password: entity.password,
      );

  @override
  String toString() {
    return 'id: $id, fname: $fname, lname: $lname, phone: $phone, email: $email, password: $password';
  }
  @override
  List<Object?> get props => [
    id,
    fname,
    lname,
    phone,
    email,
    password,
  ];
}
