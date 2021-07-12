import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/domain/entities/app_error.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
}