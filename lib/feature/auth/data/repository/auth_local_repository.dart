import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/entity/auth_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_local_data_source.dart';

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

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return const Right("");
  }
}
