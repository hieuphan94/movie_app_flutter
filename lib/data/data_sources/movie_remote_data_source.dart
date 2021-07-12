import 'package:movie_app_flutter/data/core/api_client.dart';
import 'package:movie_app_flutter/data/models/movie_model.dart';
import 'package:movie_app_flutter/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource{
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
}

class MovieRemoteSourceImlp extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteSourceImlp(this._client);

  @override
  Future<List<MovieModel>> getTrending() async{
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }
}