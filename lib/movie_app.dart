import 'package:cinema/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:cinema/screens/home_screen.dart';
import 'package:cinema/widgets/app_localizations/app_localizatios.dart';
import 'package:cinema/widgets/wiredash/wiredash_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'di/get_it.dart' as getIt;
import 'data/common/constatns/languages.dart';

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getIt.getInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (BuildContext context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                navigatorKey: _navigatorKey,
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  unselectedWidgetColor: Colors.white,
                  primarySwatch: Colors.blue,
                  accentColor: Colors.white,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                home: HomeScreen(),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
