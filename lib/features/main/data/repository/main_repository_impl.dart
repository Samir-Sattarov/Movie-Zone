import 'package:dartz/dartz.dart';

import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

import '../../domain/entities/movie_results_entity.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, MovieResultsEntity>> getMovies() async {
    try {
      final response = await remoteDataSource.getMovies( );
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
  Future<Either<AppError, MovieResultsEntity>> getPopularMovies() async {
    try {
      final response = await remoteDataSource.getPopularMovies();
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
