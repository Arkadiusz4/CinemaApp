import 'package:cinema/domain/entity/movie_entity.dart';
import 'package:cinema/widgets/home/movie_app_bar.dart';
import 'package:cinema/widgets/home/movie_backdrop_widget.dart';
import 'package:cinema/widgets/home/movie_page_view.dart';
import 'package:flutter/cupertino.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    Key key,
    @required this.movies,
    @required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MovieBackropWidget(),
        Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  MovieAppBar(),
                  MoviePageView(
                    movies: movies,
                    initalPage: defaultIndex,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
