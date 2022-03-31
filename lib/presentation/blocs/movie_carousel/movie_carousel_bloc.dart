import 'dart:async';
import 'package:cinema/domain/entity/app_error.dart';
import 'package:cinema/domain/entity/movie_entity.dart';
import 'package:cinema/domain/entity/no_params.dart';
import 'package:cinema/domain/usecases/get_playing_now.dart';
import 'package:cinema/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetPlayingNow getPlayingNow;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(
      {@required this.getPlayingNow, @required this.movieBackdropBloc})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getPlayingNow(NoParams());
      yield moviesEither.fold((l) => MovieCarouselError(l.appErrorType),
          (movies) {
        movieBackdropBloc
            .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
        return MovieCarouselLoaded(
            movies: movies, defaultIndex: event.defaultIndex);
      });
    }
  }
}
