import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return await _authRepository.uploadProfilePicture(file);
  }

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    return await _authRepository.registerStudent(student);
  }

  Future<Either<Failure, bool>> loginStudent(
      String username, String password) async {
    return await _authRepository.loginStudent(username, password);
  }
}
