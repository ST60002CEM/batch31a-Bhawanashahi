import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/dashboard/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/dashboard/domain/repository/productRepository.dart';

import '../../../../core/failure/failure.dart';

import '../data_source/product_remote_data_source.dart';

final productRemoteRepositoryProvider =
    Provider.autoDispose<IProductRepository>(
  (ref) => ProductRemoteRepoImpl(
    productRemoteDatSource: ref.read(productRemoteDatasourceProvider),
  ),
);

class ProductRemoteRepoImpl implements IProductRepository {
  final ProductRemoteDataSource productRemoteDatSource;

  const ProductRemoteRepoImpl({required this.productRemoteDatSource});

  @override
  Future<Either<Failure, bool>> addCart(ProductEntity product) {
    return productRemoteDatSource.addCart(product);
  }

  @override
  Future<Either<Failure, bool>> addFavourite(ProductEntity product) {
    return productRemoteDatSource.addFavourite(product);
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() {
    return productRemoteDatSource.getAllProducts();
  }

  // @override
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByBatch(
  //     String batchId) {
  //   // TODO: implement getAllStudentsByBatch
  //   throw UnimplementedError();
  // }
}
