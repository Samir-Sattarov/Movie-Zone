import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie_detail_entity.dart';
import '../../../domain/usecases/movie_usecases.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetailUsecase getMovieDetailUsecase;
  MovieDetailCubit(this.getMovieDetailUsecase) : super(MovieDetailInitial());

  load({required int id}) async {
    final response =
        await getMovieDetailUsecase.call(GetMovieDetailUsecaseParams(id: id));

    response.fold(
      (l) => emit(MovieDetailError(message: l.errorMessage)),
      (r) => emit(MovieDetailLoaded(r)),
    );
  }
}
