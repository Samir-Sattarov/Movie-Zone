

import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repository/main_repository.dart';

class GetCurrentUserUsecase extends UseCase<UserEntity, NoParams> {
  final MainRepository mainRepository;

  GetCurrentUserUsecase(this.mainRepository);

  @override
  Future<Either<AppError, UserEntity>> call(NoParams params) =>
      mainRepository.getCurrentUser();
}

class EditUserUsecase extends UseCase<void, UserEntity> {
  final MainRepository mainRepository;

  EditUserUsecase(this.mainRepository);

  @override
  Future<Either<AppError, void>> call(UserEntity params) =>
      mainRepository.editCurrentUser(params);
}