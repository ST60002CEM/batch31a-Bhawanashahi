import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/contact_entity.dart';


@JsonSerializable()
class ContactAPIModel {
  @JsonKey(name: '_id')
  // Server ko name lai batchId sanga map gareko
  final String? contactId;
  // J name server ma cha tei name ya lekhne
  final String contactName;
  final String contactEmail;

  final String contactMessage;

  ContactAPIModel({this.contactId, required this.contactName, required this.contactEmail, required this.contactMessage});

  // To Json and fromJson without freezed
  factory ContactAPIModel.fromJson(Map<String, dynamic> json) {
    return ContactAPIModel(
      contactId: json['_id'],
      contactName: json['contactName'],
      contactEmail:json['contactEmail'],
      contactMessage: json['contactMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactName': contactName,
      'contactEmail': contactEmail,
      'contactMessage':contactMessage

    };
  }

  // From entity to model
  factory ContactAPIModel.fromEntity(ContactEntity entity) {
    return ContactAPIModel(
      contactId: entity.contactId,
      contactName: entity.contactName,
      contactEmail: entity.contactEmail,
      contactMessage: entity.contactMessage,
    );
  }

  // From model to entity
  static ContactEntity toEntity(ContactAPIModel model) {
    return ContactEntity(
      contactId: model.contactId,
      contactName: model.contactName,
      contactEmail: model.contactEmail,
      contactMessage: model.contactMessage,
    );
  }
}
