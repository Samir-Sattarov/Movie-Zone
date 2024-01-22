
import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

class GenreResultsEntity  extends Equatable {
  final List<GenreEntity> genres;

  const GenreResultsEntity({required this.genres});

  @override
  List<Object?> get props => [genres.length];
}