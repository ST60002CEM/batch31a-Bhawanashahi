import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/product/domain/repository/productRepository.dart';

import '../../../../core/failure/failure.dart';
import '../data_source/product_local_data_source.dart';

final productLocalRepositoryProvider = Provider.autoDispose<IProductRepository>(
      (ref) => ProductLocalRepositoryImpl(
    productLocalDataSource: ref.read(productLocalDatasourceProvider),
  ),
);

class ProductLocalRepositoryImpl implements IProductRepository {
  final ProductLocalDataSource productLocalDataSource;

  ProductLocalRepositoryImpl({
    required this.productLocalDataSource,
  });




  @override
  Future<Either<Failure, List<ProductEntity>>>getAllProducts() {
    // TODO: implement getAllProducts
   return productLocalDataSource.getAllProducts();
  }

  // @override
  // Future<Either<Failure, List<AuthEntity>>> getAllStudentsByBatch(
  //     String batchId) {
  //   // TODO: implement getAllStudentsByBatch
  //   throw UnimplementedError();
  // }
}
