import 'package:equatable/equatable.dart';

class ChoiceEntity extends Equatable {
  final String title;
  final String categoryId;
  const ChoiceEntity({
    required this.title,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
        title,
    categoryId,
      ];
}
