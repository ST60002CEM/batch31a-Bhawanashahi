import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/feature/auth/data/data_source/auth_remote_data_source.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:online_pet_shop/feature/auth/domain/repository/auth_repository.dart';


final authRemoteRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  ),
);

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> loginStudent(String email, String password) async {
    return await _authRemoteDataSource.loginStudent(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    return await _authRemoteDataSource.registerStudent(student);
  }

  // @override
  // Future<Either<Failure, String>> uploadProfilePicture(File file) {
  //   return _authRemoteDataSource.uploadProfilePicture(file);
  // }
}
