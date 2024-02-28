import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/feature/dashboard/domain/entity/product.entity.dart';


import '../../../../core/failure/failure.dart';

import '../repository/productRepository.dart';

final getAllProductsUsecaseProvider = Provider.autoDispose<GetAllProductUsecase>(
  (ref) => GetAllProductUsecase(repository: ref.read(productRepositoryProvider)),
);

class GetAllProductUsecase {
  final IProductRepository repository;

  GetAllProductUsecase({required this.repository});

  Future<Either<Failure, List<ProductEntity>>>getAllProduct() async {
    return await repository.getAllProducts();
  }
}
