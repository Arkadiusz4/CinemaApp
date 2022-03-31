import 'package:flutter/material.dart';
import 'package:cinema/data/common/extensions/string_extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image, button;
  final int color;

  const AppDialog({
    Key key,
    @required this.title,
    @required this.description,
    this.buttonText,
    @required this.color,
    this.button,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(color),
      //  elevation: 30,
      insetPadding: EdgeInsets.all(35),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              title.t(context),
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Text(
              description.t(context),
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
            ),
          ),
          if (image != null) image,
          if (button != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: button,
            ),
        ],
      ),
    );
  }
}
