part of 'genres_cubit.dart';

@immutable
abstract class GenresState {}

class GenresInitial extends GenresState {}

class GenresError extends GenresState {
  final String message;

  GenresError({required this.message});
}
class GenresLoading extends GenresState {}

class GenresLoaded extends GenresState {
  final GenreResultsEntity results;

  GenresLoaded(this.results);
}
