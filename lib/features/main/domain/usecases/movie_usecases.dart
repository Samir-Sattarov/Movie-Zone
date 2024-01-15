import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/no_params.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/movie_results_entity.dart';
import '../repository/main_repository.dart';

class GetMoviesUsecase extends UseCase<MovieResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetMoviesUsecase(this.mainRepository);

  @override
  Future<Either<AppError, MovieResultsEntity>> call(NoParams params) =>
      mainRepository.getMovies();
}
