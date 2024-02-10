import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../auth/domain/entity/auth_entity.dart';
import '../../domain/entity/contact_entity.dart';
import '../../domain/repository/contact_repository.dart';
import '../data_source/contact_remote_data_source.dart';

final contactRemoteRepositoryProvider = Provider.autoDispose<IContactRepository>(
  (ref) => ContactRemoteRepoImpl(
    contactRemoteDatSource: ref.read(contactRemoteDatasourceProvider),
  ),
);

class ContactRemoteRepoImpl implements IContactRepository {
  final ContactRemoteDatSource contactRemoteDatSource;

  const ContactRemoteRepoImpl({required this.contactRemoteDatSource});

  @override
  Future<Either<Failure, bool>> addContact(ContactEntity contact) {
    return contactRemoteDatSource.addContact(contact);
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> getAllContacts() {
    return contactRemoteDatSource.getAllContacts();
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAllStudentsByContact(
      String contactId) {
    // TODO: implement getAllStudentsByBatch
    throw UnimplementedError();
  }
}
