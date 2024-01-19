import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';

import '../../../domain/usecases/movie_usecases.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetMoviesUsecase getMovieUsecase;

  MoviesCubit(this.getMovieUsecase) : super(MoviesInitial());

  load() async {
    final response = await getMovieUsecase.call(NoParams());


    response.fold(
      (l) => emit(MoviesError(message: l.errorMessage)),
      (r) => emit(MoviesLoaded(results: r)),
    );
  }
}
