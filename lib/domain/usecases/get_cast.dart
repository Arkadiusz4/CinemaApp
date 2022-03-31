import 'package:cinema/domain/entity/app_error.dart';
import 'package:cinema/domain/entity/cast_entity.dart';
import 'package:cinema/domain/entity/movie_params.dart';
import 'package:cinema/domain/repositories/movie_respository.dart';
import 'package:cinema/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}
