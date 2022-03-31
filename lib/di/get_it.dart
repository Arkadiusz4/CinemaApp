import 'package:cinema/data/core/api_client.dart';
import 'package:cinema/data/data_source/movie_remote_data_source.dart';

import 'package:cinema/data/repositiores/movie_repository_imp.dart';
import 'package:cinema/domain/repositories/movie_respository.dart';
import 'package:cinema/domain/usecases/get_cast.dart';
import 'package:cinema/domain/usecases/get_movie_detail.dart';
import 'package:cinema/domain/usecases/get_playing_now.dart';
import 'package:cinema/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:cinema/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:cinema/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:cinema/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:cinema/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getInstance = GetIt.instance;

Future init() async {
  getInstance.registerLazySingleton<Client>(() => Client());

  getInstance.registerLazySingleton<ApiClient>(() => ApiClient(getInstance()));

  getInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getInstance()));

  getInstance
      .registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getInstance()));

  getInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getInstance()));

  getInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getInstance()));

  getInstance.registerLazySingleton<GetCast>(() => GetCast(getInstance()));

  getInstance.registerFactory(() => MovieBackdropBloc());

  getInstance.registerFactory(() => MovieCarouselBloc(
        getPlayingNow: getInstance(),
        movieBackdropBloc: getInstance(),
      ));

  getInstance.registerSingleton<LanguageBloc>(LanguageBloc());

  getInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getInstance(),
      castBloc: getInstance(),
    ),
  );

  getInstance.registerFactory(
    () => CastBloc(
      getCast: getInstance(),
    ),
  );
}
