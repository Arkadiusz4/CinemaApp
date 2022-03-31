import 'package:cinema/data/common/constatns/translation_constants.dart';
import 'package:cinema/screens/movie_detail_screen.dart';
import 'package:cinema/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cinema/data/common/extensions/string_extensions.dart';

class ButtonBookNow extends StatelessWidget {
  final int movieId;

  const ButtonBookNow({Key key, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(200, 80),
        side: BorderSide(color: Colors.white, width: 2),
        backgroundColor: Colors.transparent.withOpacity(0.7),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailScreen(
              movieDetailArguments: MovieDetailArguments(movieId),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          TranslationConstants.bookNow.t(context).toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
