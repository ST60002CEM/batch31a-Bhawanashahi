import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constant/hive_table_constant.dart';
import '../../domain/entity/contact_entity.dart';

part 'contact_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.contactTableId)
class ContactHiveModel {
  @HiveField(0)
  final String contactId;

  @HiveField(1)
  final String contactName;

  @HiveField(2)
  final String contactEmail;

  @HiveField(3)
  final String contactMessage;

  // empty constructor
  ContactHiveModel.empty() : this(contactId: '', contactName: '', contactEmail: '', contactMessage:'');

  ContactHiveModel({
    String? contactId,
    required this.contactName,
    required this.contactEmail,
    required this.contactMessage,
  }) : contactId = contactId ?? const Uuid().v4();

  // Convert Entity to Hive Object
  factory ContactHiveModel.toHiveModel(ContactEntity entity) => ContactHiveModel(
    contactName: entity.contactName,
    contactEmail: entity.contactEmail,
    contactMessage:entity.contactMessage,
      );

  // Convert Hive Object to Entity
  static ContactEntity toEntity(ContactHiveModel hiveModel) => ContactEntity(
        contactId: hiveModel.contactId,
        contactName: hiveModel.contactName,
    contactEmail: hiveModel.contactEmail,
    contactMessage:hiveModel.contactMessage,
      );

  @override
  String toString() {
    return 'contactId: $contactId, contactName: $contactName, contactEmail:$contactEmail,get_all_batch_dto.g.dart contactMessage:$contactMessage';
  }
}
