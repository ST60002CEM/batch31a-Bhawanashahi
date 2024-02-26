import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constant/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/http_service.dart';
import '../../domain/entity/home.entity.dart';
import '../dto/get_all_product_dto.dart';
import '../model/home_api_model.dart';

final homeRemoteDatasourceProvider =
Provider.autoDispose<HomeRemoteDatSource>(
      (ref) => HomeRemoteDatSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class HomeRemoteDatSource {
  final Dio dio;

  HomeRemoteDatSource({required this.dio});


  // Get all batches
  // Future<Either<Failure, List<HomeEntity>>>  getAllProducts() async {
  //   try {
  //     var response = await dio.get(ApiEndpoints.getAllProduct);
  //     if (response.statusCode == 200) {
  //       GetAllHomeDTO getAllHomeDTO = GetAllHomeDTO.fromJson(response.data);
  //       // Convert BatchAPIModel to BatchEntity
  //       List<HomeEntity> homeList = getAllHomeDTO.data
  //           .map((product) => HomeAPIModel.toEntity(product))
  //           .toList();
  //
  //       return Right(homeList);
  //     } else {
  //       return Left(
  //         Failure(
  //           error: response.statusMessage.toString(),
  //           statusCode: response.statusCode.toString(),
  //         ),
  //       );
  //     }
  //   } on DioException catch (e) {
  //     return Left(Failure(error: e.response?.data['message']));
  //   }
  // }
}
