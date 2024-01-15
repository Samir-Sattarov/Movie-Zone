import 'package:flutter/material.dart';

import '../../../../../core/api/firebase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/usecases/auth_usecases.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  final LogOutUsecase _logOutUsecase;
  AuthCubit(this._loginUsecase, this._registerUsecase, this._logOutUsecase) : super(AuthInitial());

  signIn({required String email, required String password}) async {
    emit(AuthLoading());

    final response = await _loginUsecase(
        LoginUsecaseParams(email: email, password: password));

    response.fold(
      (l) => emit(AuthError(message: l.errorMessage)),
      (r) => emit(AuthLoginSuccess()),
    );
  }


  logOut()async => await _logOutUsecase.call(NoParams());


  signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());

    final response = await _registerUsecase(RegisterUsecaseParams(
      email: email,
      password: password,
      name: name,
    ));

    response.fold(
      (l) => emit(AuthError(message: l.errorMessage)),
      (r) => emit(AuthRegisterSuccess()),
    );
  }
}
