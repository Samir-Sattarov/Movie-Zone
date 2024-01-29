import 'package:flutter/foundation.dart';

import '../../../main/data/models/movie_model.dart';
import '../../../main/data/models/watched_movie_model.dart';
import '../../domain/entities/user_entity.dart';

@immutable
class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.phone,
    required super.watchedMovies,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      phone: entity.phone,
      watchedMovies: entity.watchedMovies,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      watchedMovies: List.from(json['watchedMovies'])
          .map((e) => WatchedMovieModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["id"] = id;
    data["email"] = email;
    data["name"] = name;
    data["phone"] = phone;
    data["watchedMovies"] = List.from(watchedMovies)
        .map((e) => WatchedMovieModel.fromEntity(e).toJson())
        .toList();

    return data;
  }
}
