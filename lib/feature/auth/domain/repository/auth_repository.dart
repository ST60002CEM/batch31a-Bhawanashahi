import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/auth_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(AuthEntity student);
  Future<Either<Failure, bool>> loginStudent(String username, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
