import 'package:movie_zone/core/api/api_constants.dart';

import '../../../../core/api/api_client.dart';
import '../models/movie_results_model.dart';

abstract class MainRemoteDataSource {
  Future<MovieResultsModel> getMovies();
  Future<MovieResultsModel> getPopularMovies();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;

  MainRemoteDataSourceImpl(this.client);

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
}
