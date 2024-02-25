// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/failure/failure.dart';
// import '../../domain/entity/home.entity.dart';
// import '../../domain/repository/homeRepository.dart';
// import '../data_source/home_local_data_source.dart';

// final homeLocalRepositoryProvider = Provider.autoDispose<IHomeRepository>(
//       (ref) => HomeLocalRepositoryImpl(
//     homeLocalDataSource: ref.read(homeLocalDatasourceProvider),
//   ),
// );

// class HomeLocalRepositoryImpl implements IHomeRepository {
//   final HomeLocalDataSource homeLocalDataSource;

//   HomeLocalRepositoryImpl({
//     required this.homeLocalDataSource,
//   });




//   @override
//   Future<Either<Failure, List<HomeEntity>>>getAllProducts() {
//     // TODO: implement getAllProducts
//   //  return homeLocalDataSource.getAllProducts();
//   }

//   // @override
//   // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByBatch(
//   //     String batchId) {
//   //   // TODO: implement getAllStudentsByBatch
//   //   throw UnimplementedError();
//   // }
// }
