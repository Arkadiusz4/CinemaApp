import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema/data/core/api_constants.dart';
import 'package:cinema/presentation/blocs/cast_bloc/cast_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CastWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc, CastState>(builder: (context, state) {
      if (state is CastLoaded) {
        return Container(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final castEntity = state.casts[index];
              return Container(
                height: 200,
                width: 150,
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            width: 150,
                            height: 200,
                            imageUrl:
                                '${ApiConstants.BASE_IMG_URL}${castEntity.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, bottom: 1, left: 4),
                        child: Text(
                          castEntity.name,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: GoogleFonts.openSans(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, left: 4),
                        child: Text(castEntity.character,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }
}
