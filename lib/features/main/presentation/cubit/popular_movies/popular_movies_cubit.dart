import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/entities/movie_results_entity.dart';
import '../../../domain/usecases/movie_usecases.dart';

part 'popular_movies_state.dart';

class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUsecase getPopularMoviesUsecase;

  PopularMoviesCubit(this.getPopularMoviesUsecase) : super(PopularMoviesInitial());

  load() async {
    final response =
        await getPopularMoviesUsecase.call(NoParams());

    response.fold(
      (l) => emit(PopularMoviesError(message: l.errorMessage)),
      (r) => emit(PopularMoviesLoaded(results: r)),
    );
  }
}
