import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final String? contactId;
  final String email;
  final String message;

  @override
  List<Object?> get props => [contactId, email, message];

  const ContactEntity({
    this.contactId,
    required this.email,
    required this.message
  });

  @override
  String toString() {
    return 'ContactEntity(contactId: $contactId, email: $email, message: $message)';
  }
}
