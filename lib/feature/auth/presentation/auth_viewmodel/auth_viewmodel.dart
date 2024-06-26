import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_pet_shop/config/router/app_route.dart';
import 'package:online_pet_shop/feature/auth/domain/entity/auth_entity.dart';
import 'package:online_pet_shop/feature/auth/domain/use_case/login_usecase.dart';
import 'package:online_pet_shop/feature/auth/domain/use_case/register_usecase.dart';
import 'package:online_pet_shop/feature/auth/presentation/state/auth_state.dart';


final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
    ref.read(registerUseCaseProvider),
    ref.read(loginUseCaseProvider),
  
  ),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;
 

  AuthViewModel(
    this._registerUseCase,
    this._loginUseCase,
  ) : super(AuthState.initial());

  // Future<void> uploadImage(File? file) async {
  //   state = state.copyWith(isLoading: true);
  //   var data = await _uploadImageUsecase.uploadProfilePicture(file!);
  //   data.fold(
  //     (l) {
  //       state = state.copyWith(isLoading: false, error: l.error);
  //     },
  //     (imageName) {
  //       state = state.copyWith(
  //         isLoading: false,
  //         error: null,
  //         imageName: imageName,
  //       );
  //     },
  //   );
  // }

  Future<void> createUser(AuthEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCase.createUser(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );

    resetMessage();
  }

  //Login
  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCase.loginUser(email, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );

        Navigator.popAndPushNamed(context, AppRoute.dashRoute);
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,

      showMessage: false,
    );
  }

  void resetMessage() {
    state = state.copyWith(
        showMessage: false, error: null, isLoading: false);
  }
}
