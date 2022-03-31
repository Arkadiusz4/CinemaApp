import 'package:cinema/domain/entity/app_error.dart';
import 'package:cinema/domain/entity/movie_detail_entity.dart';
import 'package:cinema/domain/entity/movie_params.dart';
import 'package:cinema/domain/repositories/movie_respository.dart';
import 'package:cinema/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}
