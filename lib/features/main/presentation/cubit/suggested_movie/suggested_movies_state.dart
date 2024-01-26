part of 'suggested_movies_cubit.dart';

@immutable
abstract class SuggestedMoviesState {}

class SuggestedMoviesInitial extends SuggestedMoviesState {}
class SuggestedMoviesLoading extends SuggestedMoviesState {}
class SuggestedMoviesError extends SuggestedMoviesState {
  final String message;

  SuggestedMoviesError({required this.message});
}
class SuggestedMoviesLoaded extends SuggestedMoviesState {
  final MovieResultsEntity results;

  SuggestedMoviesLoaded(this.results);
}
