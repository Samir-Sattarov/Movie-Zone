import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/no_params.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_results_entity.dart';
import '../repository/main_repository.dart';

class GetMoviesUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetMoviesUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) =>
      mainRepository.getMovies();
}


class GetPopularMoviesUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetPopularMoviesUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) =>
      mainRepository.getPopularMovies();
}



class GetMovieDetailUsecase extends UseCase<MovieDetailEntity, GetMovieDetailUsecaseParams> {
  final MainRepository mainRepository;

  GetMovieDetailUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(GetMovieDetailUsecaseParams params) =>
      mainRepository.getMovieDetail(params.id);
}




class GetSuggestedMovies extends UseCase<MovieResultsEntity, GetMovieDetailUsecaseParams> {
  final MainRepository mainRepository;

  GetSuggestedMovies(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(GetMovieDetailUsecaseParams params) =>
      mainRepository.getSuggestedMovies(params.id);
}


class GetSuggestedMoviesParams {
  final int id;

  GetSuggestedMoviesParams({required this.id});
}

class GetMovieDetailUsecaseParams {
  final int id;

  GetMovieDetailUsecaseParams({required this.id});
}

class GetMoviesUsecaseParams {
  final String path;

  GetMoviesUsecaseParams({required this.path});
}