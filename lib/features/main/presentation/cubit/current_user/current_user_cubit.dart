import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;
  final EditUserUsecase editUserUsecase;
  CurrentUserCubit(this.getCurrentUserUsecase, this.editUserUsecase) : super(CurrentUserInitial());

  load() async {
    final response = await getCurrentUserUsecase.call(NoParams());

    response.fold(
      (l) => emit(CurrentUserError(message: l.errorMessage)),
      (r) => emit(CurrentUserLoaded(r)),
    );
  }

  edit(UserEntity entity) async {

    final response = await editUserUsecase.call(entity);

    response.fold(
          (l) => emit(CurrentUserError(message: l.errorMessage)),
          (r) => emit(CurrentUserSaved()),
    );
  }
}
