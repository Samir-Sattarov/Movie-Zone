import '../../../main/data/models/movie_model.dart';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
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

  factory UserModel.fromJson(Map<String,dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      watchedMovies: List.from(json['watchedMovies']).map((e) => MovieModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["id"] = id;
    data["email"] = email;
    data["name"] = name;
    data["phone"] = phone;
    data["watchedMovies"] = List.from(watchedMovies)
        .map((e) => MovieModel.fromEntity(e).toJson())
        .toList();

    return data;
  }
}
