// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      studentId: json['_id'] as String?,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      username: json['email'] as String,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.studentId,
      'fname': instance.fname,
      'lname': instance.lname,
      'email': instance.email,
      'password': instance.password,
    };
