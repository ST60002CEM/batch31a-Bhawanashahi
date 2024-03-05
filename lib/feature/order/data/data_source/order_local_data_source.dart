// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../core/failure/failure.dart';
// import '../../../../core/network/hive_service.dart';
// import '../../domain/entity/order.entity.dart';
// import '../model/order_hive_model.dart';
//
// final orderLocalDatasourceProvider = Provider.autoDispose<OrderLocalDataSource>(
//       (ref) => OrderLocalDataSource(
//     hiveService: ref.read(hiveServiceProvider),
//   ),
// );
//
// class OrderLocalDataSource {
//   final HiveService hiveService;
//
//   OrderLocalDataSource({
//     required this.hiveService,
//   });
//
//   // Add Batch
//
//
//   Future<Either<Failure, List<OrderEntity>>>getAllOrders() async {
//     try {
//       List<HomeHiveModel> orders = await hiveService.getAllOrders();
//       // Convert Hive Object to Entity
//       List<OrderEntity> orderEntities =
//       orders.map((e) => HomeHiveModel.toEntity(e)).toList();
//       return Right(orderEntities);
//     } catch (e) {
//       return Left(Failure(error: e.toString()));
//     }
//   }
// }
