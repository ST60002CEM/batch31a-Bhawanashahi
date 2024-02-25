import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/product/data/dto/get_all_product_dto.dart';
import 'package:online_pet_shop/feature/product/data/model/product_api_model.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';

import '../../../../config/constant/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/http_service.dart';


final productRemoteDatasourceProvider =
Provider.autoDispose<ProductRemoteDatSource>(
      (ref) =>ProductRemoteDatSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class ProductRemoteDatSource {
  final Dio dio;

  ProductRemoteDatSource({required this.dio});


  // Get all batches
  Future<Either<Failure, List<ProductEntity>>>  getAllProducts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllProduct);
      if (response.statusCode == 200) {
        GetAllProductDTO getAllProductDTO = GetAllProductDTO.fromJson(response.data);
        // Convert BatchAPIModel to BatchEntity
        List<ProductEntity> productList = getAllProductDTO.data
            .map((product) => ProductAPIModel.toEntity(product))
            .toList();

        return Right(productList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }
}
