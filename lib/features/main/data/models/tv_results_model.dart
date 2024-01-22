import '../../domain/entities/movie_results_entity.dart';
import '../../domain/entities/tv_results_entity.dart';
import 'movie_model.dart';
import 'tv_model.dart';

class TvResultsModel extends TvResultsEntity {
  const TvResultsModel({required super.tvs});

  factory TvResultsModel.fromJson(Map<String, dynamic> json) {
    return TvResultsModel(
        tvs: List.from(json['results'])
            .map((e) => TvModel.fromJson(e))
            .toList());
  }
}
