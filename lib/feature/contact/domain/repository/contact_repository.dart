// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';


// import '../../../../core/common/provider/is_network_provider.dart';
// import '../../../../core/failure/failure.dart';
// import '../../data/data_source/contact_local_data_source.dart';
// import '../../data/data_source/contact_remote_data_source.dart';
// import '../../data/repository/contact_local_repository.dart';
// import '../../data/repository/contact_remote_repository.dart';
// import '../entity/contact_entity.dart';

// final contactRepositoryProvider = Provider<IContactRepository>(
//   (ref) {
//     if (connectivityStatusProvider ==
//         ConnectivityStatus.isConnected) {
//       return ContactRemoteRepository(
//         contactRemoteDataSource: ref.read(contactRemoteDataSourceProvider),
//       );
//     } else {
//       return ContactLocalRepositoryImpl(
//         contactLocalDataSource: ref.read(contactLocalDataSourceProvider));
//     }
//   },
// );

// abstract class IContactRepository {
//   Future<Either<Failure, bool>> addContact(ContactEntity course);
//   Future<Either<Failure, List<ContactEntity>>> getAllContacts();
//   Future<Either<Failure, bool>> deleteContact(String id);
// }
