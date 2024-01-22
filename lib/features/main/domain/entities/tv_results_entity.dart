import 'package:equatable/equatable.dart';
import 'package:movie_zone/features/main/domain/entities/tv_entity.dart';

import 'movie_entity.dart';

class TvResultsEntity extends Equatable {
  final List<TvEntity> tvs;

  const TvResultsEntity({required this.tvs});

  @override
  List<Object?> get props => [tvs.length];
}
