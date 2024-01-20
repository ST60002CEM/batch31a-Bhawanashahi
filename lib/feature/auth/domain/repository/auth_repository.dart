import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/auth_remote_repository.dart';
import '../entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => ref.read(authRemoteRepositoryProvider),
);

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(AuthEntity student);
  Future<Either<Failure, bool>> loginStudent(String email, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
