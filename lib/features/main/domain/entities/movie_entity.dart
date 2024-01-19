import 'package:equatable/equatable.dart';


class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final int overall;
  final String releaseDate;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.releaseDate,
    required this.overall,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        releaseDate,
        overall,
        imageUrl,
      ];
}
