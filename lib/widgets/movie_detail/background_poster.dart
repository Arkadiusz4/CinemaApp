import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/data/core/api_constants.dart';
import 'package:cinema/domain/entity/movie_detail_entity.dart';
import 'package:cinema/data/common/extensions/num_extensions.dart';
import 'package:cinema/widgets/movie_detail/movie_detail_app_bar.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundPoster extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const BackgroundPoster({
    Key key,
    @required this.movieDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF010023).withOpacity(0.3),
                Color(0xFF010023),
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl:
                '${ApiConstants.BASE_IMG_URL}${movieDetailEntity.posterPath}',
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 15,
          right: 20,
          left: 20,
          child: MovieDetailAppBar(),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: 50,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 80, left: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        movieDetailEntity.title,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movieDetailEntity.releaseDate,
                      style: GoogleFonts.roboto(
                          color: Colors.white.withOpacity(0.85), fontSize: 16),
                    ),
                    Text(
                      movieDetailEntity.voteAverage.convertToPercentageString(),
                      style:
                          GoogleFonts.roboto(color: Colors.blue, fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Row(
                  children: [
                    Text(
                      'Length:',
                      style: GoogleFonts.roboto(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      movieDetailEntity.runtime.toString() + 'min',
                      style: GoogleFonts.roboto(
                          color: Colors.white.withOpacity(0.85), fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
