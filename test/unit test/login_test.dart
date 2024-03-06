
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:online_pet_shop/core/failure/failure.dart';
import 'package:online_pet_shop/feature/auth/domain/use_case/login_usecase.dart';
import 'package:online_pet_shop/feature/auth/domain/use_case/register_usecase.dart';
import 'package:online_pet_shop/feature/auth/presentation/auth_viewmodel/auth_viewmodel.dart';


import 'auth_unit_test.mocks.dart';
import 'login_test.mocks.dart';
@GenerateNiceMocks([
  MockSpec<LoginUseCase>(),
  MockSpec<RegisterUseCase>(),
  MockSpec<BuildContext>()
])

void main(){
  late LoginUseCase mockLoginUseCase;
  late RegisterUseCase mockRegisterUseCase;
  late BuildContext mockBuildContext;
  late ProviderContainer container;
  setUpAll((){
    mockLoginUseCase = MockLoginUseCase();
    mockRegisterUseCase = MockRegisterUseCase();
    mockBuildContext = MockBuildContext();

    container = ProviderContainer(overrides: [
      authViewModelProvider.overrideWith(
            (ref) => AuthViewModel(mockRegisterUseCase, mockLoginUseCase),
      ),
    ]);
  });

  test('check auth initial state', (){
    final authState = container.read(authViewModelProvider);

    //check for islloading
    expect(authState.isLoading, false);
    expect(authState.imageName, isNull);
    expect(authState.error, isNull);
  });

  test('login using valid username and password',()async{
    when(mockLoginUseCase.loginUser('suman@gmail.com', 'suman12'))
        .thenAnswer((_) => Future.value(const Right(true)));

    // call login user function
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(mockBuildContext, 'suman@gmail.com', 'suman12');

    final authState = container.read(authViewModelProvider);

    expect(authState.error, isNull);
  });

  test('login using invalid username and password',()async{
    when(mockLoginUseCase.loginUser('suman@gmail.com', 'suman12'))
        .thenAnswer((_) => Future.value(Left(Failure(error: 'Invalid credentials'))));

    // call login user function
    await container
        .read(authViewModelProvider.notifier)
        .loginUser(mockBuildContext, 'suman@gmail.com', 'suman12');

    final authState = container.read(authViewModelProvider);

    expect(authState.error, 'Invalid credentials');
  });

  tearDownAll(() {
    container.dispose();
  });

}