// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../core/failure/failure.dart';
// import '../../../auth/domain/entity/auth_entity.dart';
// import '../../data/repository/contact_remote_repo_impl.dart';
// import '../entity/contact_entity.dart';
//
// // final contactRepositoryProvider = Provider.autoDispose<IContactRepository>(
// //   (ref) {
// //     return ref.read(contactRemoteRepositoryProvider);
// //   },
// // );
//
// final contactRepositoryProvider = Provider.autoDispose<IContactRepository>(
//   (ref) {
//     return ref.read(contactRemoteRepositoryProvider);
//   },
// );
//
// abstract class IContactRepository {
//   Future<Either<Failure, List<ContactEntity>>> getAllContacts();
//   Future<Either<Failure, bool>> addContact(ContactEntity contact);
//   Future<Either<Failure, List<AuthEntity>>> getAllStudentsByContact(
//       String contactId);
// }
