import 'package:json_annotation/json_annotation.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? studentId;
  final String fname;
  final String lname;
  // final String phone;
  final String email;
  final String? password;

  AuthApiModel({
    this.studentId,
    required this.fname,
    required this.lname,
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
      studentId: apiModel.studentId,
      fname: apiModel.fname,
      lname: apiModel.lname,

      // phone: apiModel.phone,

      username: apiModel.email,
      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      studentId: entity.studentId,
      fname: entity.fname,
      lname: entity.lname,
      //
      // phone: entity.phone,
  
      username: entity.email,
      password: entity.password,
    );
  }
}
  