import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/hive_service.dart';
import '../../domain/entity/contact_entity.dart';
import '../model/contact_hive_model.dart';

final contactLocalDatasourceProvider = Provider.autoDispose<ContactLocalDataSource>(
  (ref) => ContactLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
  ),
);

class ContactLocalDataSource {
  final HiveService hiveService;

  ContactLocalDataSource({
    required this.hiveService,
  });

  // Add Batch
  Future<Either<Failure, bool>> addContact(ContactEntity contact) async {
    try {
      // Convert BatchEntity to BatchHiveModel
      ContactHiveModel contactHiveModel = ContactHiveModel.toHiveModel(contact);
      hiveService.addBatch(contactHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<ContactEntity>>> getAllContacts() async {
    try {
      List<ContactHiveModel> contacts = await hiveService.getAllContacts();
      // Convert Hive Object to Entity
      List<ContactEntity> contactEntities =
          contacts.map((e) => ContactHiveModel.toEntity(e)).toList();
      return Right(contactEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
