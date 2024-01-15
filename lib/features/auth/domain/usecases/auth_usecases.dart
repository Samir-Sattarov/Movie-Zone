import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/app_error.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/auth_repository.dart';

// ================ USE CASSES ================ //



class LoginUsecase extends UseCase<bool, LoginUsecaseParams> {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  @override
  Future<Either<AppError, bool>> call(LoginUsecaseParams params) =>
      authRepository.signIn(email: params.email, password: params.password);
}

class RegisterUsecase extends UseCase<bool, RegisterUsecaseParams> {
  final AuthRepository authRepository;

  RegisterUsecase(this.authRepository);

  @override
  Future<Either<AppError, bool>> call(RegisterUsecaseParams params) =>
      authRepository.signUp(
          email: params.email, password: params.password, name: params.name,);
}


class LogOutUsecase extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  LogOutUsecase(this.authRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) =>
      authRepository.logOut();
}


// ================ PARAMS ================ //


class RegisterUsecaseParams {
  final String email;
  final String password;
  final String name;

  RegisterUsecaseParams({
    required this.email,
    required this.password,
    required this.name,
  });
}

class LoginUsecaseParams {
  final String email;
  final String password;

  LoginUsecaseParams({required this.email, required this.password});
}
