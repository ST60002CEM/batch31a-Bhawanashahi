import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/constant/api_endpoints.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/http_service.dart';
import '../../domain/entity/contact_entity.dart';
import '../dto/get_all_contact_dto.dart';
import '../model/contact_api_model.dart';

final contactRemoteDatasourceProvider =
    Provider.autoDispose<ContactRemoteDatSource>(
  (ref) => ContactRemoteDatSource(
    dio: ref.read(httpServiceProvider),
  ),
);

class ContactRemoteDatSource {
  final Dio dio;

  ContactRemoteDatSource({required this.dio});

  // Add Batch
  Future<Either<Failure, bool>> addContact(ContactEntity contact) async {
    try {
      ContactAPIModel contactAPIModel = ContactAPIModel.fromEntity(contact);
      var response = await dio.post(
        ApiEndpoints.sendMessage,
        data: contactAPIModel.toJson(),
      );
      if (response.statusCode == 201) {
        return const Right(true);
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

  // Get all batches
  Future<Either<Failure, List<ContactEntity>>> getAllContacts() async {
    try {
      var response = await dio.get(ApiEndpoints.getAllContact);
      if (response.statusCode == 200) {
        GetAllContactDTO getAllContactDTO = GetAllContactDTO.fromJson(response.data);
        // Convert BatchAPIModel to BatchEntity
        List<ContactEntity> contactList = getAllContactDTO.data
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
}
