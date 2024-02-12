import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? contactId;
  final String contactName;
  final String email;
  final String message;

  @override
  List<Object?> get props => [contactId,email, contactName, message];

  const ContactEntity({
    this.contactId,
    required this.contactName,
    required this.email,
    required this.message
  });

  @override
  String toString() {
    return 'ContactEntity(contactId: $contactId, contactName: $contactName,email:$email, message: $message)';
  }
}
