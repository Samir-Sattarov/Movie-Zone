import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.title,
    required super.description,
    required super.imageUrl,
    required super.releaseDate,
    required super.overall,
    required super.id,
  });

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      title: entity.title,
      description: entity.description,
      id: entity.id,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
      overall: entity.overall,
    );
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      description: json['description'],
      id: json['id'],
      imageUrl: json['backdrop_path'],
      releaseDate: json['release_date'],
      overall: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["title"] = title;
    data["description"] = description;
    data["id"] = id;
    data["backdrop_path"] = imageUrl;
    data["release_date"] = releaseDate;
    data["overall"] = overall;

    return data;
  }
}
