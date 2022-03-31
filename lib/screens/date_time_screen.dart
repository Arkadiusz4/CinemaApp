import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/data/core/api_constants.dart';
import 'package:cinema/domain/entity/movie_detail_entity.dart';
import 'package:cinema/widgets/date_time/item_date.dart';
import 'package:cinema/widgets/movie_detail/movie_detail_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimeScreen extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;

  const DateTimeScreen({
    Key key,
    @required this.movieDetailEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              color: Color(0xFF010023).withOpacity(0.3),
            ),
            child: _imageBlur(context),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: MediaQuery.of(context).padding.top + 15,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieDetailAppBar(),
                      Expanded(
                        child: Text(
                          movieDetailEntity.title,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Text('Choose date'),
                      ItemDate(),
                      Text('Choose time'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageBlur(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: CachedNetworkImage(
            imageUrl:
                '${ApiConstants.BASE_IMG_URL}${movieDetailEntity.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFF010023),
          ),
        ),
      ],
    );
  }
}
