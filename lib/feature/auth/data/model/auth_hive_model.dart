import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constant/hive_table_constant.dart';

// part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;


  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String email;




  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.fname,
    required this.lname,
    required this.email,
    required this.username,
    required this.password,
  }) : userId= userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(

          fname: '',
          lname: '',
          email: '',
          username: '',
          password: '',
        );

  @override
  String toString() {
    return 'userId: $userId, fname: $fname, lname: $lname, email: $email, username: $username, password: $password';
  }
}
