import 'package:bloc/bloc.dart';
import 'package:cinema/domain/entity/app_error.dart';
import 'package:cinema/domain/entity/movie_detail_entity.dart';
import 'package:cinema/domain/entity/movie_params.dart';
import 'package:cinema/domain/usecases/get_movie_detail.dart';
import 'package:cinema/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;

  MovieDetailBloc({
    @required this.getMovieDetail,
    @required this.castBloc,
  }) : super(MovieDetailInitial());

  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    if (event is MovieDetailLoadEvent) {
      final Either<AppError, MovieDetailEntity> eitherResponse =
          await getMovieDetail(
        MovieParams(event.movieId),
      );
      yield eitherResponse.fold(
        (l) => MovieDetailIError(),
        (r) => MovieDetailLoaded(r),
      );

      castBloc.add(LoadCastEvent(movieId: event.movieId));
    }
  }
}
