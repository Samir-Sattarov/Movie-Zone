import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_zone/core/entities/no_params.dart';
import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';
import 'package:movie_zone/features/main/domain/usecases/movie_usecases.dart';

import 'movie_test.mocks.dart';

// class MockMainRepository extends Mock implements MainRepository {}
// class MockMoviesUsecase extends Mock implements GetMoviesUsecase{}

@GenerateMocks([MainRepository])
void main() {
  late GetMoviesUsecase getMoviesUsecase;
  late MockMainRepository mockMainRepository;

  setUp(() {
    mockMainRepository = MockMainRepository();
    getMoviesUsecase = GetMoviesUsecase(mockMainRepository);
  });

  test(
    'GetMoviesUsecase should return movies from repository',
    () async {
      // arrange
      const movieResultsEntity = MovieResultsEntity(movies: []);

      // act
      when(mockMainRepository.getMovies())
          .thenAnswer((_) async => const Right(movieResultsEntity));

      final result = await getMoviesUsecase(NoParams());

      // assert
      expect(result, equals(const Right(movieResultsEntity)));
      // verify(mockMainRepository.getMovies()).called(1);
      // verifyNoMoreInteractions(mockMainRepository);
    },
  );
}

//import 'package:bloc_test/bloc_test.dart';
// import 'package:dartz/dartz.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart';
// import 'package:mockito/mockito.dart';
// import 'package:movie_zone/core/api/api_client.dart';
// import 'package:movie_zone/core/api/firebase_api.dart';
// import 'package:movie_zone/core/entities/no_params.dart';
// import 'package:movie_zone/core/utils/secure_storage.dart';
// import 'package:movie_zone/features/auth/data/datasources/auth_local_data_source.dart';
// import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
// import 'package:movie_zone/features/main/data/repository/main_repository_impl.dart';
// import 'package:movie_zone/features/main/domain/entities/movie_results_entity.dart';
// import 'package:movie_zone/features/main/domain/usecases/movie_usecases.dart';
// import 'package:movie_zone/features/main/presentation/cubit/movies/movies_cubit.dart';
//
// class MockApiClient extends Mock implements ApiClientImpl {}
//
// class MockFirebaseApi extends Mock implements FirebaseApi {}
//
// class MockMainRemoteDataSource extends Mock
//     implements MainRemoteDataSourceImpl {}
//
// class MockAuthLocalDataSource extends Mock implements AuthLocalDataSourceImpl {}
//
// class MockMainRepository extends Mock implements MainRepositoryImpl {}
//
// void main() {
//   late MainRepositoryImpl mockRepository;
//   late MainRemoteDataSourceImpl mainRemoteDataSource;
//   late AuthLocalDataSource authLocalDataSource;
//   late GetMoviesUsecase getMovieUsecase;
//   late MoviesCubit moviesCubit;
//   late ApiClient apiClient;
//   late FirebaseApi firebaseApi;
//
//   final Client client = Client();
//   final SecureStorage secureStorage = SecureStorage();
//
//   setUp(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//
//     // Mock FirebaseApi and AuthLocalDataSource
//     authLocalDataSource = AuthLocalDataSourceImpl(secureStorage);
//     firebaseApi = MockFirebaseApi();
//
//     when(authLocalDataSource.getToken()).thenAnswer((_) async => 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjhiYjdlNjcxZGI5MDk4YzkyODIwNzI2YzFlMzNmMyIsInN1YiI6IjY1OTI5OTU5NjUxZmNmNWYxMzhlYjg3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pdqI_L93K4mexvxfX3KxhY43wEH6bCybCYHhuR1PaOw'); // Ensure 'mockedToken' is of type String
//
//
//     apiClient = ApiClientImpl(client, authLocalDataSource);
//     mainRemoteDataSource = MainRemoteDataSourceImpl(apiClient, firebaseApi);
//     mockRepository = MainRepositoryImpl(mainRemoteDataSource);
//     getMovieUsecase = GetMoviesUsecase(mockRepository);
//     moviesCubit = MoviesCubit(getMovieUsecase);
//
//     when(getMovieUsecase.call(NoParams()))
//         .thenAnswer((_) async => const Right(MovieResultsEntity(movies: [])));
//   });
//
//   blocTest<MoviesCubit, MoviesState>(
//     'TODO: description',
//     build: () => moviesCubit,
//     act: (cubit) => cubit..load(),
//     expect: () => <MoviesState>[
//       const MoviesLoaded(results: MovieResultsEntity(movies: [])),
//     ],
//   );
// }
