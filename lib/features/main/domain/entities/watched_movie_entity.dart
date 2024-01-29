import 'package:equatable/equatable.dart';

import 'movie_detail_entity.dart';

class WatchedMovieEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final int runtime;
  final String releaseDate;

  const WatchedMovieEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.runtime,
  });



  @override
  List<Object?> get props => [
        id,
        title,
        releaseDate,
        runtime,
        imageUrl,
      ];
}
