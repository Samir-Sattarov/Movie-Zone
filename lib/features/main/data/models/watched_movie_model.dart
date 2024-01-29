
import '../../domain/entities/movie_detail_entity.dart';
import '../../domain/entities/watched_movie_entity.dart';

class WatchedMovieModel extends WatchedMovieEntity {
  const WatchedMovieModel({
    required super.title,
    required super.imageUrl,
    required super.releaseDate,
    required super.runtime,
    required super.id,
  });


  factory WatchedMovieModel.fromMovieDetail(MovieDetailEntity entity) {
    return WatchedMovieModel(
      title: entity.title,
      id: entity.id,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
      runtime: entity.runtime,
    );
  }


  factory WatchedMovieModel.fromEntity(WatchedMovieEntity entity) {
    return WatchedMovieModel(
      title: entity.title,
      id: entity.id,
      imageUrl: entity.imageUrl,
      releaseDate: entity.releaseDate,
      runtime: entity.runtime,
    );
  }

  factory WatchedMovieModel.fromJson(Map<String, dynamic> json) {
    return WatchedMovieModel(
      title: json['title'],
      id: json['id'] ,
      imageUrl: json['poster_path'] ?? "",
      releaseDate: json['release_date'],
      runtime: json['runtime'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data["title"] = title;
    data["id"] = id;
    data["poster_path"] = imageUrl;
    data["release_date"] = releaseDate;
    data["runtime"] = runtime;

    return data;
  }
}
