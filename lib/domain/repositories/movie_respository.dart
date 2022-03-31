import 'package:cinema/domain/entity/app_error.dart';
import 'package:cinema/domain/entity/cast_entity.dart';
import 'package:cinema/domain/entity/movie_detail_entity.dart';
import 'package:cinema/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getNowPlaying();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);
}
