import 'package:dartz/dartz.dart';

import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/usecases/action.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

import '../../domain/entities/movie_results_entity.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, MovieResultsEntity>> getMovies() async {
    return await action<MovieResultsEntity>(task: remoteDataSource.getMovies());
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> getPopularMovies() async {
    return await action<MovieResultsEntity>(
      task: remoteDataSource.getPopularMovies(),
    );
  }

  @override
  Future<Either<AppError, UserEntity>> getCurrentUser() async {
    return await action<UserEntity>(
      task: remoteDataSource.getCurrentUser(),
    );
  }
}
