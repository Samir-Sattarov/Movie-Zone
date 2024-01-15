
import '../../domain/entities/movie_results_entity.dart';
import 'movie_model.dart';

class MovieResultsModel extends MovieResultsEntity {
  const MovieResultsModel({required super.movies});

  factory MovieResultsModel.fromJson(Map<String,dynamic> json) {
    return MovieResultsModel(
      movies: List.from(json['results']).map((e) => MovieModel.fromJson(e)).toList()
    );
  }



}
