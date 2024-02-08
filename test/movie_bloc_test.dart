import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';
import 'package:movie_zone/features/main/domain/usecases/movie_usecases.dart';
import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';

import 'movie_test.mocks.dart';

@GenerateMocks([GetMoviesUsecase])
void main() {
  late GetMoviesUsecase getMoviesUsecase;
  late MoviesCubit moviesCubit;

  setUp(() {
    // ================ UseCases ================ //

    getMoviesUsecase = MockGetMoviesUsecase();

    // ================ When ================ //

    when(getMoviesUsecase.call(NoParams())).thenAnswer(
        (_) async => Future.value(const Right(MovieResultsEntity(movies: []))));
    // ================ Cubits ================ //

    moviesCubit = MoviesCubit(getMoviesUsecase);
  });

  blocTest<MoviesCubit, MoviesState>(
    "Movies Cubit Complete fetch",
    build: () => moviesCubit,
    act: (cubit) => cubit.load(),
    expect: () => <MoviesState>[
      const MoviesLoaded(results: MovieResultsEntity(movies: [])),
    ],
  );
}
