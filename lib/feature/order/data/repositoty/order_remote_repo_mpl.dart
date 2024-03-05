// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../../core/failure/failure.dart';
// import '../../domain/entity/order.entity.dart';
// import '../../domain/repository/orderRepository.dart';
// import '../data_source/order_remote_data_source.dart';

// final homeRemoteRepositoryProvider = Provider.autoDispose<IHomeRepository>(
//       (ref) => HomeRemoteRepoImpl(
//     homeRemoteDatSource: ref.read(homeRemoteDatasourceProvider),
//   ),
// );

// class HomeRemoteRepoImpl implements IHomeRepository {
//   final HomeRemoteDatSource homeRemoteDatSource;

//   const HomeRemoteRepoImpl({required this.homeRemoteDatSource});

//   @override
//   Future<Either<Failure, List<HomeEntity>>>getAllProducts() {
//     return homeRemoteDatSource.getAllProducts();
//   }

//   // @override
//   // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByBatch(
//   //     String batchId) {
//   //   // TODO: implement getAllStudentsByBatch
//   //   throw UnimplementedError();
//   // }
// }
