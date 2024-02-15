import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? contactId;
  final String contactName;
  final String  contactEmail;
  final String  contactMessage;

  @override
  List<Object?> get props => [contactId,contactName,  contactEmail,  contactMessage];

  const ContactEntity({
    this.contactId,
    required this. contactName,
    required this. contactEmail,
    required this. contactMessage
  });

  @override
  String toString() {
    return 'ContactEntity(contactId: $contactId, contactName: $contactName, contactEmail:$contactEmail,  contactMessage: $contactMessage)';
  }
}
