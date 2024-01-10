import 'package:dartz/dartz.dart';

import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_remote_data_source.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, bool>> signIn(
      {required String email, required String password}) async {
    try {
      final response =
          await remoteDataSource.signIn(email: email, password: password);
      return Right(response);
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, bool>> signUp(
      {required String email, required String password, required String name}) async {
    try {
      final response =
          await remoteDataSource.signUp(email: email, password: password, name: name);
      return Right(response);
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
