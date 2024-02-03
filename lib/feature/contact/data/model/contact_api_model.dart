// import 'package:json_annotation/json_annotation.dart';

// import '../../domain/entity/contact_entity.dart';


// part 'contact_api_model.g.dart';

// @JsonSerializable()
// class ContactAPIModel {
//   @JsonKey(name: '_id')
//   final String? contactId;
//   final String email;
//   final String message;

//   ContactAPIModel({this.contactId, required this.email, required this.message});

//   factory ContactAPIModel.fromJson(Map<String, dynamic> json) =>
//       _$ContactAPIModelFromJson(json);

//   Map<String, dynamic> toJson() => _$ContactAPIModelToJson(this);

//   // From entity to model
//   factory ContactAPIModel.fromEntity(ContactEntity entity) {
//     return ContactAPIModel(
//       contactId: entity.contactId,
//       email: entity.email,
//       message: entity.message
//     );
//   }

//   // From model to entity
//   static ContactEntity toEntity(ContactAPIModel model) {
//     return ContactEntity(
//       contactId: model.contactId,
//       email: model.email,
//       message: model.message
//     );
//   }

//   ContactEntity toAEntity() =>
//       ContactEntity(contactId: contactId, email: email, message:message);

//   ContactAPIModel toHiveModel(ContactEntity entity) {
//     return ContactAPIModel(
//       contactId: entity.contactId,
//       email: entity.email,
//       message: entity.message
//     );
//   }

//   List<ContactAPIModel> toHiveModelList(List<ContactEntity> entities) =>
//       entities.map((entity) => toHiveModel(entity)).toList();

//   List<ContactEntity> toEntityList(List<ContactAPIModel> models) =>
//       models.map((model) => model.toAEntity()).toList();
 
// }
