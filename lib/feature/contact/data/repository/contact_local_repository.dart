import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/contact_entity.dart';
import '../../domain/repository/contact_repository.dart';
import '../data_source/contact_local_data_source.dart';

final contactLocalRepositoryProvider = Provider.autoDispose<IContactRepository>(
  (ref) => ContactLocalRepositoryImpl(
    contactLocalDataSource: ref.read(contactLocalDataSourceProvider),
  ),
);

class ContactLocalRepositoryImpl implements IContactRepository {
  final ContactLocalDataSource contactLocalDataSource;

  ContactLocalRepositoryImpl({required this.contactLocalDataSource});

  @override
  Future<Either<Failure, bool>> addContact(ContactEntity course) {
    return contactLocalDataSource.addContact(course);
  }

  @override
  Future<Either<Failure, List<ContactEntity>>> getAllContacts() {
    return contactLocalDataSource.getAllContacts();
  }

  @override
  Future<Either<Failure, bool>> deleteContact(String id) {
    // TODO: implement deleteCourse
    throw UnimplementedError();
  }
}
