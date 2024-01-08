import 'package:equatable/equatable.dart';

import '../../../main/domain/entities/movie_entity.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String phone;
  final List<MovieEntity> watchedMovies;

  const UserEntity({
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
