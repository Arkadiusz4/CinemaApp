import 'package:cinema/domain/entity/app_error.dart';
import 'package:cinema/domain/entity/movie_entity.dart';
import 'package:cinema/domain/entity/no_params.dart';
import 'package:cinema/domain/repositories/movie_respository.dart';
import 'package:cinema/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getNowPlaying();
  }
}
