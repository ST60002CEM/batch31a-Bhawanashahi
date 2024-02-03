import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/feature/auth/data/data_source/auth_local_data_source.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:online_pet_shop/feature/auth/domain/repository/auth_repository.dart';


final authLocalRepositoryProvider = Provider.autoDispose<IAuthRepository>(
  (ref) => AuthLocalRepository(ref.read(authLocalDataSourceProvider)),
);

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginStudent(String username, String password) {
    return _authLocalDataSource.loginStudent(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
    return _authLocalDataSource.registerStudent(student);
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   return const Right("");
  // }
}
