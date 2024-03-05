// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../config/constant/api_endpoints.dart';
// import '../../../../core/failure/failure.dart';
// import '../../../../core/network/http_service.dart';
// import '../../domain/entity/order.entity.dart';
// import '../dto/get_all_order_dto.dart';
// import '../model/order_api_model.dart';
//
// final homeRemoteDatasourceProvider =
// Provider.autoDispose<OrderRemoteDatSource>(
//       (ref) => OrderRemoteDatSource(
//     dio: ref.read(httpServiceProvider),
//   ),
// );
//
// class OrderRemoteDatSource {
//   final Dio dio;
//
//   OrderRemoteDatSource({required this.dio});
//
//
//
//   Future<Either<Failure, List<HomeEntity>>>  getAllorders() async {
//     try {
//       var response = await dio.get(ApiEndpoints.getAllorder);
//       if (response.statusCode == 200) {
//         GetAllOrderDTO getAllOrderDTO = GetAllOrderDTO.fromJson(response.data);
//         // Convert BatchAPIModel to BatchEntity
//         List<OrderEntity> orderList = getAllOrderDTO.data
//             .map((order) => orderAPIModel.toEntity(order))
//             .toList();
//
//         return Right(orderList);
//       } else {
//         return Left(
//           Failure(
//             error: response.statusMessage.toString(),
//             statusCode: response.statusCode.toString(),
//           ),
//         );
//       }
//     } on DioException catch (e) {
//       return Left(Failure(error: e.response?.data['message']));
//     }
//   }
// }
