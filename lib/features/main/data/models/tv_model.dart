import '../../domain/entities/tv_entity.dart';

class TvModel extends TvEntity {
  const TvModel({
    required super.id,
    required super.title,
    required super.imageUrl,
    required super.overall,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      title: json['name'],
      id: json['id'],
      imageUrl: json['poster_path'] ?? "",
      overall: json['vote_count'],
    );
  }
}
