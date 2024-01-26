import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/movie_results_entity.dart';
import '../../../domain/usecases/movie_usecases.dart';

part 'suggested_movies_state.dart';

class SuggestedMoviesCubit extends Cubit<SuggestedMoviesState> {
  final GetSuggestedMovies getSuggestedMovies;
  SuggestedMoviesCubit(this.getSuggestedMovies) : super(SuggestedMoviesInitial());
  
  
  load(int id) async {
    
    final response =await getSuggestedMovies.call(GetMovieDetailUsecaseParams(id: id),);
    
    response.fold((l) => emit(SuggestedMoviesError(message: l.errorMessage)), (r) => emit(SuggestedMoviesLoaded(r)));
  }
}
