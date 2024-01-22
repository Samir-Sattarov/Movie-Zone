part of 'tv_cubit.dart';

@immutable
abstract class TvState {}

class TvInitial extends TvState {}

class TvError extends TvState {
  final String message;

  TvError({required this.message});
}

class TvLoading extends TvState {}

class TvLoaded extends TvState {
  final TvResultsEntity results;

  TvLoaded(this.results);
}
