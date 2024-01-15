import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());
}
