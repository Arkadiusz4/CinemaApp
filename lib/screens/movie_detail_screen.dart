import 'package:cinema/data/common/constatns/translation_constants.dart';
import 'package:cinema/di/get_it.dart';
import 'package:cinema/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:cinema/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:cinema/screens/date_time_screen.dart';
import 'package:cinema/widgets/movie_detail/background_poster.dart';
import 'package:cinema/widgets/movie_detail/cast_widget.dart';
import 'package:cinema/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cinema/data/common/extensions/string_extensions.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    Key key,
    @required this.movieDetailArguments,
  })  : assert(movieDetailArguments != null, 'arguments must not be null'),
        super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  MovieDetailBloc _movieDetailBloc;
  CastBloc _castBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getInstance<MovieDetailBloc>();
    _castBloc = _movieDetailBloc.castBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(widget.movieDetailArguments.movieId),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _castBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010023),
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _castBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BackgroundPoster(
                          movieDetailEntity: movieDetail,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5, left: 15),
                          child: Text(
                            'Story line',
                            style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            movieDetail.overview,
                            style: GoogleFonts.lato(
                                color: Colors.white.withOpacity(0.85),
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                            overflow: TextOverflow.fade,
                            softWrap: true,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 20, left: 15, bottom: 10),
                          child: Text(
                            'Cast',
                            style: GoogleFonts.roboto(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: CastWidget(),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, right: 15, left: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DateTimeScreen(
                              movieDetailEntity: movieDetail,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue),
                            child: OutlinedButton(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                margin: EdgeInsets.symmetric(vertical: 15),
                                height: 25,
                                child: Text(
                                  TranslationConstants.bookNow
                                      .t(context)
                                      .toUpperCase(),
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onPressed: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is MovieDetailIError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
