import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/data/core/api_constants.dart';
import 'package:cinema/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBackropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FractionallySizedBox(
          heightFactor: 1,
          widthFactor: 1,
          child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
            builder: (context, state) {
              if (state is MovieBackdropChanged) {
                return CachedNetworkImage(
                  imageUrl:
                      '${ApiConstants.BASE_IMG_URL}${state.movieEntity.backdropPath}',
                  fit: BoxFit.fitHeight,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
