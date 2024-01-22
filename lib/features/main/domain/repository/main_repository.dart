import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/genre_results_entity.dart';
import '../entities/movie_results_entity.dart';

abstract class MainRepository {
  Future<Either<AppError, MovieResultsEntity>> getMovies();
  Future<Either<AppError, MovieResultsEntity>> getPopularMovies();
  Future<Either<AppError, UserEntity>> getCurrentUser();
  Future<Either<AppError, GenreResultsEntity>> getGenres();
}
