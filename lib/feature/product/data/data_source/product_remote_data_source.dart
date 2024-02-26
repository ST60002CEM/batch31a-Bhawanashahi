
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/config/constant/api_endpoints.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/core/network/http_service.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';

final productRemoteDatasourceProvider = Provider.autoDispose<ProductRemoteDataSource>(
      (ref) => ProductRemoteDataSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource({required this.dio});

  // Get all products
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllProduct);
      if (response.statusCode == 200) {
        final List<dynamic> productsJson = response.data['products'];
        // Map each product JSON to ProductEntity
        List<ProductEntity> productList = productsJson
            .map((json) => ProductEntity(
                  productId: json['_id'],
                  productName: json['productName'],
                  productPrice: json['productPrice'],
                  productCategory: json['productCategory'],
                  productImageUrl: json['productImageUrl'],
                ))
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
    // ignore: deprecated_member_use
    } on DioError catch (e) {
      // Handle Dio errors
      if (e.response != null) {
        // Dio response error
        return Left(
          Failure(
            error: e.response!.data['message'].toString(),
            statusCode: e.response!.statusCode.toString(),
          ),
        );
      } else {
        // Dio request error
        return Left(
          Failure(
            error: e.error.toString(),
          ),
        );
      }
    } catch (e) {
      // Handle other errors
      return Left(Failure(error: e.toString()));
    }
  }
}
