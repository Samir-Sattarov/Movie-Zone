import 'package:flutter/material.dart';

import '../../../../../core/api/firebase_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseApi firebaseApi;
  AuthCubit(this.firebaseApi) : super(AuthInitial());

  signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await firebaseApi.signIn(email: email, password: password);
      emit(AuthLoginSuccess());
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }

  signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());

    try {
      await firebaseApi.signUp(email: email, password: password, name: name);
      emit(AuthRegisterSuccess());
    } catch (error) {
      emit(AuthError(message: error.toString()));
    }
  }
}
