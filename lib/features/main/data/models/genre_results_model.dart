import '../../domain/entities/genre_results_entity.dart';
import 'genre_model.dart';

class GenreResultsModel extends GenreResultsEntity {
  const GenreResultsModel({required super.genres});

  factory GenreResultsModel.fromJson(Map<String, dynamic> json) {
    return GenreResultsModel(
      genres: List<Map<String, dynamic>>.from(json['genres'])
          .map((e) => GenreModel.fromJson(e))
          .toList(),
    );
  }
}
