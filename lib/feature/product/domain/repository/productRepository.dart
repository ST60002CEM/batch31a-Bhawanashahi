import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';


import '../../../../core/failure/failure.dart';
import '../../data/repositoty/product_remote_repo_mpl.dart';

// final batchRepositoryProvider = Provider.autoDispose<IBatchRepository>(
//   (ref) {
//     return ref.read(batchRemoteRepositoryProvider);
//   },
// );

final productRepositoryProvider = Provider.autoDispose<IProductRepository>(
      (ref) {
    return ref.read(productRemoteRepositoryProvider);
  },
);

abstract class IProductRepository {
    Future<Either<Failure, bool>> addCart(ProductEntity batch);
  Future<Either<Failure, List<ProductEntity>>>getAllProducts();

}
