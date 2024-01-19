import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../entities/movie_results_entity.dart';

abstract class MainRepository {
  Future<Either<AppError, MovieResultsEntity>> getMovies();
  Future<Either<AppError, MovieResultsEntity>> getPopularMovies();
}
