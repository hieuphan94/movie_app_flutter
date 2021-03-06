import 'package:dartz/dartz.dart';
import 'package:movie_app_flutter/domain/entities/app_error.dart';
import 'package:movie_app_flutter/domain/entities/movie_entity.dart';
import 'package:movie_app_flutter/domain/entities/no_params.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/usecase.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPopular(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPopular();
  }
}
