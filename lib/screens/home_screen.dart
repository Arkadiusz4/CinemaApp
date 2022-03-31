import 'package:cinema/di/get_it.dart';
import 'package:cinema/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:cinema/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:cinema/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:cinema/widgets/drawer/navigation_drawer.dart';
import 'package:cinema/widgets/home/carousel_load_error_widget.dart';
import 'package:cinema/widgets/home/movie_carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc movieCarouselBloc;
  MovieBackdropBloc movieBackdropBloc;
  LanguageBloc languageBloc;

  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getInstance<MovieCarouselBloc>();
    movieBackdropBloc = movieCarouselBloc.movieBackdropBloc;
    languageBloc = getInstance<LanguageBloc>();
    movieCarouselBloc.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    languageBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => movieCarouselBloc,
        ),
        BlocProvider(
          create: (context) => movieBackdropBloc,
        ),
        BlocProvider(create: (context) => languageBloc),
      ],
      child: Scaffold(
        drawer: NavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          bloc: movieCarouselBloc,
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return MovieCarouselWidget(
                movies: state.movies,
                defaultIndex: state.defaultIndex,
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                appErrorType: state.appErrorType,
                onPressed: () => movieCarouselBloc.add(
                  CarouselLoadEvent(),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
