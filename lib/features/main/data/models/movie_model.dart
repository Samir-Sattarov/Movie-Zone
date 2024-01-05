import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel({
    required super.title,
    required super.description,
    required super.time,
    required super.imageUrl,
    required super.createdAt,
    required super.overall,
  });

  factory MovieModel.fromEntity(MovieEntity entity) {
    return MovieModel(
      title: entity.title,
      description: entity.description,
      time: entity.time,
      imageUrl: entity.imageUrl,
      createdAt: entity.createdAt,
      overall: entity.overall,
    );
  }

  factory MovieModel.fromJson(Map<String,dynamic> json) {
    return MovieModel(
      title: json['title'],
      description: json['description'],
      time: json['time'],
      imageUrl: json['imageUrl'],
      createdAt: json['createdAt'],
      overall: json['overall'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["title"] = title;
    data["description"] = description;
    data["time"] = time;
    data["imageUrl"] = imageUrl;
    data["createdAt"] = createdAt;
    data["overall"] = overall;

    return data;
  }
}
