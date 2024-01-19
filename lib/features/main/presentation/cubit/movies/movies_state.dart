part of 'movies_cubit.dart';

abstract class MoviesState {
  const MoviesState();
}

class MoviesInitial extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final MovieResultsEntity results;

  const MoviesLoaded({required this.results});
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError({required this.message});
}

class MoviesLoading extends MoviesState {}
