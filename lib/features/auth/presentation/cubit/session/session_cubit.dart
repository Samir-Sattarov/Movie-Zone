import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_zone/features/auth/domain/usecases/session_usecases.dart';

import '../../../../../core/entities/no_params.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  final CheckActiveSession _checkActiveSession;
  SessionCubit(this._checkActiveSession) : super(SessionDisabled());

  checkSession() async {
    final response = await _checkActiveSession.call(NoParams());

    response.fold((l) => emit(SessionDisabled()), (r) {



      if(r) {
        emit(SessionActive());
      }else {
        emit(SessionDisabled());
      }
    });
  }
}
