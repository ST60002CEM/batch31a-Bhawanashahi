import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constant/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/http_service.dart';
import '../../../../core/shared_prefs/user_shared_prefs.dart';
import '../../domain/entity/contact_entity.dart';
import '../dto/get_all_contact_dto.dart';
import '../model/contact_api_model.dart';

final contactRemoteDataSourceProvider =
    Provider.autoDispose<ContactRemoteDataSource>(
  (ref) => ContactRemoteDataSource(
    dio: ref.read(httpServiceProvider),
    userSharedPrefs: ref.read(userSharedPrefsProvider),
  ),
);

class ContactRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  ContactRemoteDataSource({required this.dio, required this.userSharedPrefs});

  Future<Either<Failure, List<ContactEntity>>> getAllContacts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllContact);
      if (response.statusCode == 200) {
        // Convert CourseAPIModel to CourseEntity
        GetAllContactDTO contactAddDTO = GetAllContactDTO.fromJson(response.data);
        List<ContactEntity> contactList = contactAddDTO.data
            .map((contact) => ContactAPIModel.toEntity(contact))
            .toList();

        return Right(contactList);
      } else {
        return Left(
          Failure(
            error: response.statusMessage.toString(),
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(Failure(error: e.response?.data['message']));
    }
  }

  Future<Either<Failure,bool>> deleteContact(String contactId) async{
    try{
      String? token;
      var data= await userSharedPrefs.getUserToken();
      data.fold((l) => token=null, (r) => token = r!);

      Response response = await dio.delete(
        ApiEndpoints.deleteContact + contactId,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token'
          },
        ),
      );
      if (response.statusCode== 200){
        return const Right(true);
      } else{
        return Left(
          Failure(
            error: response.data['message'],
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
