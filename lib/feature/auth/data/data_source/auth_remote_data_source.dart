import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/config/constant/api_endpoints.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/core/network/http_service.dart';
import 'package:online_pet_shop/core/shared_prefs/user_shared_prefs.dart';
import 'package:online_pet_shop/feature/auth/data/model/auth_api_model.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSource(
    ref.read(httpServiceProvider),
    ref.read(userSharedPrefsProvider)
  ),
);

class AuthRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  AuthRemoteDataSource(this.dio,this.userSharedPrefs);

  Future<Either<Failure, bool>> loginStudent(
    String email,
    String password,
  ) async {
    try {
      Response response = await dio.post(
        ApiEndpoints.login,
        data: {
          "email":email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data["token"];
        await userSharedPrefs.setUserToken(token);
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

  // Upload image using multipart
  // Future<Either<Failure, String>> uploadProfilePicture(
  //   File image,
  // ) async {
  //   try {
  //     String fileName = image.path.split('/').last;
  //     FormData formData = FormData.fromMap(
  //       {
  //         'profilePicture': await MultipartFile.fromFile(
  //           image.path,
  //           filename: fileName,
  //         ),
  //       },
  //     );
  //
  //     Response response = await dio.post(
  //       ApiEndpoints.uploadImage,
  //       data: formData,
  //     );
  //
  //     return Right(response.data["data"]);
  //   } on DioException catch (e) {
  //     return Left(
  //       Failure(
  //         error: e.error.toString(),
  //         statusCode: e.response?.statusCode.toString() ?? '0',
  //       ),
  //     );
  //   }
  // }

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    try {
      AuthApiModel apiModel = AuthApiModel.fromEntity(student);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "fname": apiModel.fname,
          "lname": apiModel.lname,
          "phone": apiModel.phone,
          "email": apiModel.email,
          "password": apiModel.password,
        },

        // "course": ["6489a5908dbc6d39719ec19c", "6489a5968dbc6d39719ec19e"]
      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }
}
