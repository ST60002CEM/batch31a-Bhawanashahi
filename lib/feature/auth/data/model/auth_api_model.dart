import 'package:json_annotation/json_annotation.dart';



import '../../domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: '_id')
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final String? image;
  final String email;

  final String? password;

  AuthApiModel({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    this.image,
    required this.email,
    this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To entity
  factory AuthApiModel.toEntity(AuthApiModel apiModel) {
    return AuthApiModel(
      id: apiModel.id,
      fname: apiModel.fname,
      lname: apiModel.lname,
      phone: apiModel.phone,
      image: apiModel.image,
      email: apiModel.email,

      password: apiModel.password,
    );
  }

  // From entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      id: entity.id,
      fname: entity.fname,
      lname: entity.lname,
      phone: entity.phone,
      image: entity.image,
      email: entity.email,
      password: entity.password,
    );
  }
}
  