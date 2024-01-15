import 'package:dartz/dartz.dart';
import 'package:movie_zone/core/entities/no_params.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/auth_repository.dart';

class CheckActiveSession extends UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  CheckActiveSession(this.authRepository);

  @override
  Future<Either<AppError, bool>> call(NoParams params) =>
      authRepository.checkActiveSession();
}
