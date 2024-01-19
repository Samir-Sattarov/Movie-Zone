import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';

import '../../../../auth/domain/entities/user_entity.dart';
import '../../../domain/usecases/user_usecase.dart';

part 'current_user_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserState> {
  final GetCurrentUserUsecase getCurrentUserUsecase;
  CurrentUserCubit(this.getCurrentUserUsecase) : super(CurrentUserInitial());

  load() async {
    final response = await getCurrentUserUsecase.call(NoParams());

    response.fold(
      (l) => emit(CurrentUserError(message: l.errorMessage)),
      (r) => emit(CurrentUserLoaded(r)),
    );
  }
}
