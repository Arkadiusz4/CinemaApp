import 'package:cinema/widgets/app_localizations/app_localizatios.dart';
import 'package:flutter/cupertino.dart';

extension StringExtensions on String {
  String t(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}
