// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:uuid/uuid.dart';
//
// import '../../../../config/constant/hive_table_constant.dart';
// import '../../domain/entity/auth_entity.dart';
//
// part 'batch_hive_model.g.dart';
//
// @HiveType(typeId: HiveTableConstant.userTableId)
// class AuthHiveModel {
//   @HiveField(0)
//   final String userId;
//
//   @HiveField(1)
//   final String firstName;
//   @HiveField(1)
//   final String lastName;
//   @HiveField(1)
//   final String email;
//   @HiveField(1)
//   final String password;
//
//   // empty constructor
//   AuthHiveModel.empty() : this(userId: '', firstName: '', lastName:'', email:'', password:'');
//
//   AuthHiveModel({
//     String? batchId,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.password,
//   }) : userId = userId ?? const Uuid().v4();
//
//   // Convert Hive Object to Entity
//   static AuthEntity toEntity(AuthHiveModel hiveModel) => AuthEntity(
//         userId: hiveModel.userId,
//         firstName: hiveModel.firstName,
//        lastName: hiveModel.lastName,
//     email: hiveModel.email,
//     password: hiveModel.password,
//       );
//
//   // Convert Entity to Hive Object
//   factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
//         // batchId: entity.batchId,
//     firstName: entity.firstName,
//     lastName: entity.lastName,
//     email: entity.email,
//     password: entity.password,
//       );
//
//   @override
//   String toString() {
//     return 'userId: $userId, firstName: $firstName', lastName:$lastname', email:$email, password:$password;
//   }
// }
