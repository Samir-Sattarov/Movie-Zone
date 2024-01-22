import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.title,
    required super.imageUrl,
    required super.releaseDate,
    required super.overall,
    required super.id,
  });

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      title: entity.title,
      id: entity.id,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
      overall: entity.overall,
    );
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      id: json['id'],
      imageUrl: json['poster_path'],
      releaseDate: json['release_date'],
      overall: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["title"] = title;
    data["id"] = id;
    data["poster_path"] = imageUrl;
    data["release_date"] = releaseDate;
    data["overall"] = overall;

    return data;
  }
}
