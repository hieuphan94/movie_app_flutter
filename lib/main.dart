import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app_flutter/data/core/api_client.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app_flutter/domain/entities/no_params.dart';

import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending.dart';

Future<void> main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteSourceImlp(apiClient);
  //dataSource.getTrending();
  //dataSource.getPopular();

  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  //movieRepository.getTrending();

  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      print('error');
      print(l);
    },
    (r) {
      print('list of movies');
      print(r);
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold());
  }
}
