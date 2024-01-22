

import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../entities/genre_results_entity.dart';
import '../repository/main_repository.dart';

class GetGenresUsecase extends UseCase<GenreResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetGenresUsecase(this.mainRepository);

  @override
  Future<Either<AppError, GenreResultsEntity>> call(NoParams params) =>
      mainRepository.getGenres();
}
