part of 'search_movies_cubit.dart';

@immutable
abstract class SearchMoviesState {}

class SearchInitial extends SearchMoviesState {}
class SearchLoading extends SearchMoviesState {}
class SearchLoaded extends SearchMoviesState {
  final MovieResultsEntity results;

  SearchLoaded(this.results);
}
class SearchError extends SearchMoviesState {
  final String message;

  SearchError({required this.message});
}
