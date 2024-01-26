import 'package:dartz/dartz.dart';

import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/usecases/action.dart';
import 'package:movie_zone/features/auth/domain/entities/user_entity.dart';
import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
import 'package:movie_zone/features/main/domain/entities/genre_results_entity.dart';
import 'package:movie_zone/features/main/domain/entities/movie_detail_entity.dart';
import 'package:movie_zone/features/main/domain/entities/tv_results_entity.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';

import '../../../auth/data/models/user_model.dart';
import '../../domain/entities/movie_results_entity.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, MovieResultsEntity>> getMovies() async {
    return await action<MovieResultsEntity>(
      task: remoteDataSource.getMovies(),
    );
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

  @override
  Future<Either<AppError, GenreResultsEntity>> getGenres() async {
    return await action<GenreResultsEntity>(
      task: remoteDataSource.getGenres(),
    );
  }

  @override
  Future<Either<AppError, TvResultsEntity>> getTv() async {
    return await action<TvResultsEntity>(
      task: remoteDataSource.getTv(),
    );
  }

  @override
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id) async {
    return await action<MovieDetailEntity>(
      task: remoteDataSource.getMovieDetail(id),
    );
  }

  @override
  Future<Either<AppError, void>> editCurrentUser(UserEntity user) async {
    return await action<void>(
      task: remoteDataSource.editUser(UserModel.fromEntity(user)),
    );
  }

  @override
  Future<Either<AppError, MovieResultsEntity>> getSuggestedMovies(int id)async  {
    return await action<MovieResultsEntity>(
      task: remoteDataSource.getSuggestedMovies(id),
    );
  }
}
