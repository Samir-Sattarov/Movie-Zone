part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}



class MoviesLoaded extends MoviesState {
  final MovieResultsEntity results;

  const MoviesLoaded({required this.results});
  @override
  List<Object> get props => [results.movies.length];
}


class MoviesError extends MoviesState {
  final String message;

  const MoviesError({required this.message});
  @override
  List<Object> get props => [];
}



class MoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}
