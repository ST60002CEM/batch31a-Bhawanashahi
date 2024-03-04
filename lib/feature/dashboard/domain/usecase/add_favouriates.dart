import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/feature/dashboard/domain/entity/product.entity.dart';
import 'package:online_pet_shop/feature/dashboard/domain/repository/productRepository.dart';


final addFavouriateUsecaseProvider = Provider.autoDispose<AddFavouriateUsecase>(
  (ref) => AddFavouriateUsecase(repository: ref.watch(productRepositoryProvider)),
);

class AddFavouriateUsecase {
  final IProductRepository repository;

  AddFavouriateUsecase({required this.repository});

  Future<Either<Failure, bool>> addFavourite(ProductEntity product) async {
    return await repository.addFavourite(product);
  }
}
