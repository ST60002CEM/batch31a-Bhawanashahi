import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_pet_shop/config/constant/hive_table_constant.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:uuid/uuid.dart';


part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String firstName;

  @HiveField(2)
  final String lastName;


  @HiveField(3)
  final String email;

  @HiveField(4)
  final String password;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.firstName,
    required this.lastName,
    // required this.phone,

    required this.email,
    required this.password,
  }) : userId =userId ?? const Uuid().v4();

  // // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          firstName: '',
          lastName: '',
          // phone: '',
          email: '',
          password: '',
        );

  // Convert Entity to Hive Object
  factory AuthHiveModel.toHiveModel(AuthEntity entity) => AuthHiveModel(
        firstName: entity.firstName,
        lastName: entity.lastName,
        // phone: entity.phone,
        email: entity.email,
        password: entity.password,
      );

  // Convert Hive Object to Entity
  static AuthEntity toEntity(AuthHiveModel hiveModel) => AuthEntity(
         userId: hiveModel.userId,
        firstName: hiveModel.firstName,
        lastName: hiveModel.lastName,
        // phone: hiveModel.phone,
        email: hiveModel.email,
        password: hiveModel.password,
      );

  @override
  String toString() {
    return 'userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, password: $password';
  }

  @override
  List<Object?> get props => [
        userId,
        firstName,
        lastName,
        // phone,
        email,
        password,
      ];
}
