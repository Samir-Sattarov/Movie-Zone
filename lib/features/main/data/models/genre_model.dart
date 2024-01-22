import '../../domain/entities/genre_entity.dart';

class GenreModel extends GenreEntity {
  const GenreModel({required super.id, required super.title});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      title: json['name'],
    );
  }
}
