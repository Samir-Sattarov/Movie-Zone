import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final String title;
  final String description;
  final String imageUrl;
  final int overall;

  const MovieDetailEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.overall,
  });

  @override
  List<Object?> get props => [
        description,
        title,
        overall,
        imageUrl,
      ];
}
