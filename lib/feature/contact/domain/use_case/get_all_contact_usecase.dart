import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/contact_entity.dart';
import '../repository/contact_repository.dart';

final getAllContactUsecaseProvider = Provider.autoDispose<GetAllContactUsecase>(
      (ref) => GetAllContactUsecase(repository: ref.read(contactRepositoryProvider)),
);

class GetAllContactUsecase {
  final IContactRepository repository;

  GetAllContactUsecase({required this.repository});

  Future<Either<Failure, List<ContactEntity>>> getAllContact() async {
    return await repository.getAllContacts();
  }
}
