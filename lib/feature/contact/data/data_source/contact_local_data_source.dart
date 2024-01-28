import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/hive_service.dart';
import '../../domain/entity/contact_entity.dart';
import '../model/contact_hive_model.dart';

final contactLocalDataSourceProvider =
    Provider.autoDispose<ContactLocalDataSource>(
  (ref) => ContactLocalDataSource(hiveService: ref.read(hiveServiceProvider)),
);

class ContactLocalDataSource {
  final HiveService hiveService;

  ContactLocalDataSource({required this.hiveService});

  // Add Course
  Future<Either<Failure, bool>> addContact(ContactEntity contact) async {
    try {
      // Convert CourseEntity to Model
      ContactHiveModel contactHiveModel =ContactHiveModel.toHiveModel(contact);
      // Add Course to Hive
      hiveService.addContact(contactHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get All Courses
  Future<Either<Failure, List<ContactEntity>>> getAllContacts() async {
    try {
      // Get All Courses from Hive
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
