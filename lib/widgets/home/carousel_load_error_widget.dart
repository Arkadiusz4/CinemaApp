import 'package:cinema/data/common/constatns/translation_constants.dart';
import 'package:cinema/domain/entity/app_error.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiredash/wiredash.dart';
import 'package:cinema/data/common/extensions/string_extensions.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  final Function onPressed;

  const AppErrorWidget({
    Key key,
    @required this.appErrorType,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF010023), Color(0xFF010023).withOpacity(0.85)],
          begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appErrorType == AppErrorType.api
                  ? TranslationConstants.somethingWrong.t(context)
                  : TranslationConstants.checkNetwork.t(context),
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ButtonBar(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.9),
                          Colors.blue.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => onPressed,
                      child: Text(
                        TranslationConstants.retry.t(context),
                        style:
                            GoogleFonts.lato(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.9),
                          Colors.blue.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () => Wiredash.of(context).show(),
                      child: Text(
                        TranslationConstants.feedback.t(context),
                        style:
                            GoogleFonts.lato(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
