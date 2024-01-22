
import 'package:equatable/equatable.dart';

class GenreEntity  extends Equatable {
  final int id;
  final String title;

  const GenreEntity({required this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}