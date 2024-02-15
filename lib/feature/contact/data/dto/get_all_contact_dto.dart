import 'package:json_annotation/json_annotation.dart';

import '../model/contact_api_model.dart';


part 'get_all_contact_dto.g.dart';

//dart run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class GetAllContactDTO {
  final bool success;
  final int count;
  final List<ContactAPIModel> data;

  GetAllContactDTO({
    required this.success,
    required this.count,
    required this.data,
  });

  factory GetAllContactDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllContactDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllContactDTOToJson(this);
}
