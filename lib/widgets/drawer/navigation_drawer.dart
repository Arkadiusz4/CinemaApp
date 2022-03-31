import 'package:cinema/data/common/constatns/languages.dart';
import 'package:cinema/data/common/constatns/translation_constants.dart';
import 'package:cinema/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:cinema/widgets/app_dialog.dart';
import 'package:cinema/widgets/drawer/navigation_expanded_list_tile.dart';
import 'package:cinema/widgets/drawer/navigation_list_item.dart';
import 'package:cinema/data/common/extensions/string_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withOpacity(0.5),
            blurRadius: 4,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.65,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                bottom: 10,
                left: 8,
                right: 8,
              ),
              child: Text(''),
            ),
            NavigationListItem(
              title: TranslationConstants.favoriteMovies.t(context),
              onPressed: () {},
            ),
            NavigationExpandedListTile(
              title: TranslationConstants.language.t(context),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(
                    Languages.languages[index],
                  ),
                );
              },
              children: Languages.languages.map((e) => e.value).toList(),
            ),
            NavigationListItem(
              title: TranslationConstants.feedback.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: TranslationConstants.about.t(context),
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AppDialog(
      color: 0xFF032541,
      title: TranslationConstants.about,
      description: TranslationConstants.aboutDescription,
      image: Container(
        height: 150,
        child: Image.network(
          'https://pbs.twimg.com/profile_images/1243623122089041920/gVZIvphd_400x400.jpg',
        ),
      ),
      button: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent.withOpacity(0.9),
              Colors.blue.withOpacity(0.5)
            ],
          ),
        ),
        child: OutlinedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 15),
            height: 25,
            child: Text(
              TranslationConstants.okay.t(context),
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ),
  );
}
