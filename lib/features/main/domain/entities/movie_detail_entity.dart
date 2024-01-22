import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String imageUrl;
  final String title;
  final String description;
  final int runtime;
  final double voteAverage;
  final String releaseDate;
  final List<GenreEntity> genres;

  const MovieDetailEntity({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.runtime,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        title,
        description,
        runtime,
        voteAverage,
        releaseDate,
        genres,
      ];
}
