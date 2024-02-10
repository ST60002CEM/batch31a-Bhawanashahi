import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? contactId;
  final String contactName;
  final String message;

  @override
  List<Object?> get props => [contactId, contactName, message];

  const ContactEntity({
    this.contactId,
    required this.contactName,
    required this.message
  });

  @override
  String toString() {
    return 'ContactEntity(contactId: $contactId, contactName: $contactName, message: $message)';
  }
}
