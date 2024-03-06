import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:online_pet_shop/feature/auth/domain/use_case/register_usecase.dart';

import 'register_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<RegisterUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late MockRegisterUseCase mockRegisterUseCase;
  setUpAll(() async {
    mockRegisterUseCase = MockRegisterUseCase();
  });
  group('test register', () {
    setUpAll(() {
      /// if provided certain credential returen the proper mock user
      when(
        mockRegisterUseCase.createUser(AuthEntity(
          email: 'test@example.com',
          password: 'password',
          firstName: 'Test',
          lastName: 'User',
        )),
      ).thenAnswer(
            (_) async => const Right(true),
      );
    });
    test('test signup with proper cradential', () async {
      // Call the login method
      final result = await mockRegisterUseCase.createUser(AuthEntity(
        email: 'test@example.com',
        password: 'password',
        firstName: 'Test',
        lastName: 'User',
      ));
      // Verify the expected result
      expect(result, const Right(true));
    });
    test('test signup with invalid credentials', () async {
      /// Creating a proper mock failure for failed login with invalid email
      final mockErrorModel = Failure(
        error: 'Please enter valid email',
      );
      /// if provided certain credential returen the mockErrorModel
      when(
        mockRegisterUseCase.createUser(AuthEntity(
          email: 'test@example.com',
          password: 'password',
          firstName: 'Test1',
          lastName: 'User1',
        )),
      ).thenAnswer(
            (_) async => Left(mockErrorModel),
      );
      // Call the login method
      final result = await mockRegisterUseCase.createUser(AuthEntity(
        email: 'test@example.com',
        password: 'password',
        firstName: 'Test1',
        lastName: 'User1',
      ));
      // Verify the expected result
      expect(
        result,
        Left(mockErrorModel),
      );
    });
    test('test signup with no credentials', () async {
      /// Creating a proper mock failure for failed login with invalid email
      final mockErrorModel = Failure(
        error: 'Please enter email',
      );
      /// if provided certain credential returen the mockErrorModel
      when(
        mockRegisterUseCase.createUser(AuthEntity(
          email: 'null',
          password: 'null',
          firstName: 'null',
          lastName: 'null',
        )),
      ).thenAnswer(
            (_) async => Left(mockErrorModel),
      );
      // Call the login method
      final result = await mockRegisterUseCase.createUser(AuthEntity(
        email: 'null',
        password: 'null',
        firstName: 'null',
        lastName: 'null',
      ));
      // Verify the expected result
      expect(
        result,
        Left(mockErrorModel),
      );
    });
  });
}