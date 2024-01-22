import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_detail_entity.dart';
import 'genre_model.dart';

class MovieDetailModel extends MovieDetailEntity {
  const MovieDetailModel(
      {required super.id,
      required super.imageUrl,
      required super.title,
      required super.description,
      required super.runtime,
      required super.voteAverage,
      required super.releaseDate,
      required super.genres});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      imageUrl: json['poster_path'],
      title: json['title'],
      description: json['overview'],
      runtime: json['runtime'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
      genres:
          List.from(json['genres']).map((e) => GenreModel.fromJson(e)).toList(),
    );
  }
}
