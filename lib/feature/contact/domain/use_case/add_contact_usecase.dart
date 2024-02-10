import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/contact_entity.dart';
import '../repository/contact_repository.dart';

final addContactUsecaseProvider = Provider.autoDispose<AddContactUsecase>(
  (ref) => AddContactUsecase(repository: ref.watch(contactRepositoryProvider)),
);

class AddContactUsecase {
  final IContactRepository repository;

  AddContactUsecase({required this.repository});

  Future<Either<Failure, bool>> addContact(ContactEntity contact) async {
    return await repository.addContact(contact);
  }
}
