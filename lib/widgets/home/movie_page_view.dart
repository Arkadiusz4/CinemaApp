import 'package:cinema/domain/entity/movie_entity.dart';
import 'package:cinema/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:cinema/widgets/home/animated_movie_card_widget.dart';
import 'package:cinema/widgets/home/book_now_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initalPage;

  const MoviePageView({
    Key key,
    @required this.movies,
    @required this.initalPage,
  })  : assert(initalPage >= 0, 'defaultIndex cannot be less than 0'),
        super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initalPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movieEntity = widget.movies[index];
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.all(30),
            child: Column(
              children: [
                AnimatedMovieCardWidget(
                  index: index,
                  pageController: _pageController,
                  movieId: movieEntity.id,
                  posterPath: movieEntity.posterPath,
                ),
                Container(
                  height: 150,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                        builder: (context, state) {
                          if (state is MovieBackdropChanged) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                state.movieEntity.title,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      ButtonBookNow(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        pageSnapping: true,
        itemCount: widget.movies?.length ?? 0,
        onPageChanged: (index) {
          BlocProvider.of<MovieBackdropBloc>(context)
              .add(MovieBackdropChangedEvent(widget.movies[index]));
        },
      ),
    );
  }
}
