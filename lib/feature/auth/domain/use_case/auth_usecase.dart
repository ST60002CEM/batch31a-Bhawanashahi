import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/auth_entity.dart';
import '../repository/auth_repository.dart';

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  // Future<Either<Failure, String>> uploadProfilePicture(File file) async {
  //   return await _authRepository.uploadProfilePicture(file);
  // }

  Future<Either<Failure, bool>> createUser(AuthEntity user) async {
    return await _authRepository.createUser(user);
  }

  Future<Either<Failure, bool>> loginUser(
      String email, String password) async {
    return await _authRepository.loginUser(email, password);
  }
}
