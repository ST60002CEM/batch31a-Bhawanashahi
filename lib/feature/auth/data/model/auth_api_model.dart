import 'package:json_annotation/json_annotation.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? userId;
  final String firstName;
  final String lastName;
  // final String phone;
  final String email;
  final String? password;

  AuthApiModel({
    this.userId,
    required this.firstName,
    required this.lastName,
    // required this.phone,
    required this.email,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      userId: apiModel.userId,
      firstName: apiModel.firstName,
      lastName: apiModel.lastName,

      // phone: apiModel.phone,

      email: apiModel.email,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      userId: entity.userId,
      firstName: entity.firstName,
      lastName: entity.lastName,
      //
      // phone: entity.phone,

      email: entity.email,
      password: entity.password,
    );
  }
}
  