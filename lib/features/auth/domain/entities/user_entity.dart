import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../main/domain/entities/watched_movie_entity.dart';


@immutable
class UserEntity extends Equatable {
  final String id;
  late String email;
  late String name;
  final String phone;
  final List<WatchedMovieEntity> watchedMovies;

    UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.watchedMovies,
  });

  factory UserEntity.empty({String id = "", String name = "", String email = ""}) {
    return UserEntity(
      id: id,
      email: email,
      name:name,
      phone: "",
      watchedMovies: const [],
    );
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
