import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/network/hive_service.dart';
import '../../domain/entity/auth_entity.dart';
import '../model/auth_hive_model.dart';

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
      String email,
      String password,
      ) async {
    var isLogin = await _hiveService.loginStudent(email, password);
    if (isLogin) {
      return const Right(true);
    } else {
      return Left(Failure(error: "Invalid email or password"));
    }
  }
}


