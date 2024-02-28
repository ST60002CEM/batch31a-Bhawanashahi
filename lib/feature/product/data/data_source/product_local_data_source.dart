import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/product/data/model/product_hive_model.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/hive_service.dart';

final productLocalDatasourceProvider = Provider.autoDispose<ProductLocalDataSource>(
      (ref) => ProductLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
  ),
);

class ProductLocalDataSource {
  final HiveService hiveService;

  ProductLocalDataSource({
    required this.hiveService,
  });

 Future<Either<Failure, bool>> addCart(ProductEntity product) async {
    try {
      // Convert BatchEntity to BatchHiveModel
      ProductHiveModel productHiveModel = ProductHiveModel.toHiveModel(product);
      hiveService.addCart(productHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, List<ProductEntity>>>getAllProducts() async {
    try {
      List<ProductHiveModel> products = await hiveService.getAllProducts();
      // Convert Hive Object to Entity
      List<ProductEntity> productEntities =
      products.map((e) => ProductHiveModel.toEntity(e)).toList();
      return Right(productEntities);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
