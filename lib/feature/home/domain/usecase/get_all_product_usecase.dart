import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../entity/home.entity.dart';
import '../repository/homeRepository.dart';

final getAllProductApiUsecaseProvider = Provider.autoDispose<GetAllHomeUsecase>(
  (ref) => GetAllHomeUsecase(repository: ref.read(homeRepositoryProvider)),
);

class GetAllHomeUsecase {
  final IHomeRepository repository;

  GetAllHomeUsecase({required this.repository});

  Future<Either<Failure, List<HomeEntity>>> getAllProductApi() async {
    return await repository.getAllProductApi();
  }
}
