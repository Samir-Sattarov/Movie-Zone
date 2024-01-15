import 'package:equatable/equatable.dart';

import 'movie_entity.dart';

class MovieResultsEntity extends Equatable {
  final List<MovieEntity> movies;

  const MovieResultsEntity({required this.movies});

  @override
  List<Object?> get props => [movies.length];
}
