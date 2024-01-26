import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';

import '../../../domain/usecases/movie_usecases.dart';

part 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesCubit(this.searchMovies) : super(SearchInitial());

  load({required String query}) async {
    final response = await searchMovies.call(SearchMoviesParams(query: query));

    response.fold((l) => emit(SearchError(message: l.errorMessage)),
        (r) => emit(SearchLoaded(r)));
  }
}
