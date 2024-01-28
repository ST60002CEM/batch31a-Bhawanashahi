import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/contact_entity.dart';
import '../../domain/repository/contact_repository.dart';
import '../data_source/contact_remote_data_source.dart';

final contactRemoteRepositoryProvider = Provider.autoDispose<IContactRepository>(
  (ref) => ContactRemoteRepository(
    contactRemoteDataSource: ref.read(contactRemoteDataSourceProvider),
  ),
);

class ContactRemoteRepository implements IContactRepository {
  final ContactRemoteDataSource contactRemoteDataSource;

  const ContactRemoteRepository({required this.contactRemoteDataSource});
  @override
  Future<Either<Failure, bool>> addContact(ContactEntity contact) {
    // TODO: implement addCourse
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> deleteContact(String id) {
    return contactRemoteDataSource.deleteContact(id);
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> getAllContacts() {
    return contactRemoteDataSource.getAllContacts();
  }


}
