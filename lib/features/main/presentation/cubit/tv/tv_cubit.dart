import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/entities/tv_results_entity.dart';
import '../../../domain/usecases/tv_usecase.dart';

part 'tv_state.dart';

class TvCubit extends Cubit<TvState> {
  final GetTvUsecase getTvUsecase;
  TvCubit(this.getTvUsecase) : super(TvInitial());

  load() async {
    final response = await getTvUsecase.call(NoParams());

    response.fold(
      (l) => emit(TvError(message: l.errorMessage)),
      (r) => emit(TvLoaded(r)),
    );
  }
}
