import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/entities/genre_results_entity.dart';
import '../../../domain/usecases/genres_usecase.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GetGenresUsecase _genresUsecase;
  GenresCubit(this._genresUsecase) : super(GenresInitial());

  load() async {
    emit(GenresLoading());
    final response = await _genresUsecase.call(NoParams());

    response.fold((l) => emit(GenresError(message: l.errorMessage)),
        (r) => emit(GenresLoaded(r)));
  }
}
