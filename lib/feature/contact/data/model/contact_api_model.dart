import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/contact_entity.dart';


@JsonSerializable()
class ContactAPIModel {
  @JsonKey(name: '_id')
  // Server ko name lai batchId sanga map gareko
  final String? contactId;
  // J name server ma cha tei name ya lekhne
  final String contactName;
  final String email;

  final String message;

  ContactAPIModel({this.contactId, required this.contactName, required this.email, required this.message});

  // To Json and fromJson without freezed
  factory ContactAPIModel.fromJson(Map<String, dynamic> json) {
    return ContactAPIModel(
      contactId: json['_id'],
      contactName: json['contactName'],
      email:json['email'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contactName': contactName,
      'email': email,
      'message':message

    };
  }

  // From entity to model
  factory ContactAPIModel.fromEntity(ContactEntity entity) {
    return ContactAPIModel(
      contactId: entity.contactId,
      contactName: entity.contactName,
      email: entity.email,
      message: entity.message,
    );
  }

  // From model to entity
  static ContactEntity toEntity(ContactAPIModel model) {
    return ContactEntity(
      contactId: model.contactId,
      contactName: model.contactName,
      email: model.email,
      message: model.message,
    );
  }
}
