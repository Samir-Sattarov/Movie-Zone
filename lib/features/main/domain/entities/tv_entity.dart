import 'package:equatable/equatable.dart';

class TvEntity extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final int overall;

  const TvEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.overall,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        overall,
        imageUrl,
      ];
}
