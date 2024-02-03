import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/core/network/hive_service.dart';
import 'package:online_pet_shop/feature/auth/data/model/auth_hive_model.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';


final authLocalDataSourceProvider = Provider<AuthLocalDataSource>(
  (ref) => AuthLocalDataSource(ref.watch(hiveServiceProvider)),
);

class AuthLocalDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  Future<Either<Failure, bool>> registerStudent(AuthEntity entity) async {
    try {
      // Convert auth entity to auth hive model
      AuthHiveModel authHiveModel = AuthHiveModel.toHiveModel(entity);
      // Save auth hive model to hive
      await _hiveService.registerStudent(authHiveModel);
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginStudent(
    String username,
    String password,
  ) async {
    var isLogin = await _hiveService.loginStudent(username, password);
    if (isLogin) {
      return const Right(true);
    } else {
      return Left(Failure(error: "Invalid username or password"));
    }
  }
}
