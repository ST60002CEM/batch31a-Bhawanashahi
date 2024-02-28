import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/feature/product/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/product/domain/repository/productRepository.dart';

final addCartUsecaseProvider = Provider.autoDispose<AddCartUsecase>(
  (ref) => AddCartUsecase(repository: ref.watch(productRepositoryProvider)),
);

class AddCartUsecase {
  final IProductRepository repository;

  AddCartUsecase({required this.repository});

  Future<Either<Failure, bool>> addCart(ProductEntity product) async {
    return await repository.addCart(product);
  }
}
