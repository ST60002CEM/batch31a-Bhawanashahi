// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllHomeDTO _$GetAllHomeDTOFromJson(Map<String, dynamic> json) =>
    GetAllHomeDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => HomeAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllHomeDTOToJson(GetAllHomeDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
