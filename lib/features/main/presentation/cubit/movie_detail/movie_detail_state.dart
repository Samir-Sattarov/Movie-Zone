part of 'movie_detail_cubit.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}
class MovieDetailLoading extends MovieDetailState {}
class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError({required this.message});
}
class MovieDetailLoaded extends MovieDetailState {
  final MovieDetailEntity detail;

  MovieDetailLoaded(this.detail);
}
