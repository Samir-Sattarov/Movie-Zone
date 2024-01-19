part of 'popular_movies_cubit.dart';

@immutable
abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final MovieResultsEntity results;

  PopularMoviesLoaded({required this.results});
}

class PopularMoviesError extends PopularMoviesState {
  final String message;

  PopularMoviesError({required this.message});
}

class PopularMoviesLoading extends PopularMoviesState {}
