import 'package:movie_zone/core/api/api_constants.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/firebase_api.dart';
import '../../../auth/data/models/user_model.dart';
import '../models/movie_results_model.dart';

abstract class MainRemoteDataSource {
  Future<MovieResultsModel> getMovies();
  Future<MovieResultsModel> getPopularMovies();
  Future<UserModel> getCurrentUser();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;
  final FirebaseApi firebaseApi;

  MainRemoteDataSourceImpl(this.client, this.firebaseApi);

  @override
  Future<MovieResultsModel> getMovies() async {
    final response = await client.get(ApiConstants.movies, {});

    final model = MovieResultsModel.fromJson(response);

    return model;
  }

  @override
  Future<MovieResultsModel> getPopularMovies() async {
    final response = await client.get(ApiConstants.topRatedMovies, {});

    final model = MovieResultsModel.fromJson(response);

    return model;
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final response = await firebaseApi.getCurrentUser();
    return response;
  }
}
