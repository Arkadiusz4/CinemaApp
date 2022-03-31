import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/data/core/api_constants.dart';
import 'package:cinema/screens/movie_detail_screen.dart';
import 'package:cinema/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key key,
    @required this.movieId,
    @required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieId),
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: '${ApiConstants.BASE_IMG_URL}$posterPath',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
