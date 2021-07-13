import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app_flutter/data/core/api_client.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app_flutter/data/repositories/movie_repository_impl.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/get_coming_soon.dart';
import 'package:movie_app_flutter/domain/usecases/get_playing_now.dart';
import 'package:movie_app_flutter/domain/usecases/get_popular.dart';
import 'package:movie_app_flutter/domain/usecases/get_trending.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteSourceImlp(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));
}