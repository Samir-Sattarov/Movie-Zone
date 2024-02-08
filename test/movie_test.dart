import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_zone/core/entities/app_error.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';
import 'package:movie_zone/features/main/domain/usecases/movie_usecases.dart';

import 'movie_test.mocks.dart';

@GenerateMocks([GetMoviesUsecase])
void main() {
  late GetMoviesUsecase getMoviesUsecase;

  setUp(() {
    getMoviesUsecase = MockGetMoviesUsecase();
  });

  test(
    'GetMoviesUsecase should return movies from repository',
    () async {
      // arrange
      const movieResultsEntity = MovieResultsEntity(movies: []);
      final Future<Either<AppError, MovieResultsEntity>>
          expectedValueForAnswer =
          Future.value(const Right(movieResultsEntity));
      const expectedValue = Right(movieResultsEntity);

      // act
      when(getMoviesUsecase.call(NoParams()))
          .thenAnswer((_) async => expectedValueForAnswer);

      final result = await getMoviesUsecase.call(NoParams());

      //assert
      expect(result, equals(expectedValue));
    },
  );
}
