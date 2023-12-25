import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String description;
  final String trailerUrl;
  final String time;
  final String imageUrl;
  final int overall;
  final DateTime createdAt;

  const MovieEntity({
    required this.title,
    this.trailerUrl = "",
    required this.description,
    required this.time,
    required this.imageUrl,
    required this.createdAt,
    required this.overall,
  });

  @override
  List<Object?> get props => [
        description,
        title,
        createdAt,
        overall,
        imageUrl,
      ];
}
