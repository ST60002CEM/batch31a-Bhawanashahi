// import 'package:json_annotation/json_annotation.dart';
//
// import '../model/contact_api_model.dart';
//
//
// part 'get_all_contact_dto.g.dart';
//
// @JsonSerializable()
// class GetAllContactDTO {
//   final bool success;
//   final int count;
//   final List<ContactAPIModel> data;
//
//   GetAllContactDTO(
//       {required this.success, required this.count, required this.data});
//
//   factory GetAllContactDTO.fromJson(Map<String, dynamic> json) =>
//       _$GetAllContactDTOFromJson(json);
//
//   Map<String, dynamic> toJson() => _$GetAllContactDTOToJson(this);
//
//   static GetAllContactDTO toEntity(GetAllContactDTO getAllContactDTO) {
//     return GetAllContactDTO(
//       success: getAllContactDTO.success,
//       count: getAllContactDTO.count,
//       data: getAllContactDTO.data,
//     );
//   }
//
//   static GetAllContactDTO fromEntity(GetAllContactDTO getAllContactDTO) {
//     return GetAllContactDTO(
//       success: getAllContactDTO.success,
//       count: getAllContactDTO.count,
//       data: getAllContactDTO.data,
//     );
//   }
// }
