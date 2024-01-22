

import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/tv_results_entity.dart';
import '../repository/main_repository.dart';

class GetTvUsecase extends UseCase<TvResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetTvUsecase(this.mainRepository);

  @override
  Future<Either<AppError, TvResultsEntity>> call(NoParams params) =>
      mainRepository.getTv();
}
