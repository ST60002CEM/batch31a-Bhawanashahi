import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/hive_service.dart';
import '../../domain/entity/home.entity.dart';
import '../model/home_hive_model.dart';

final homeLocalDatasourceProvider = Provider.autoDispose<HomeLocalDataSource>(
      (ref) => HomeLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
  ),
);

class HomeLocalDataSource {
  final HiveService hiveService;

  HomeLocalDataSource({
    required this.hiveService,
  });

  // Add Batch


  // Future<Either<Failure, List<HomeEntity>>>getAllProducts() async {
  //   try {
  //     List<HomeHiveModel> products = await hiveService.getAllProducts();
  //     // Convert Hive Object to Entity
  //     List<HomeEntity> homeEntities =
  //     products.map((e) => HomeHiveModel.toEntity(e)).toList();
  //     return Right(homeEntities);
  //   } catch (e) {
  //     return Left(Failure(error: e.toString()));
  //   }
  // }
}
