import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key key,
    @required this.navigatorKey,
    @required this.child,
    @required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: navigatorKey,
      projectId: 'cinema-app-t4mmk1h',
      secret: 'TkPdVbtMxbpTYVA-VPxuzQgwlUOPkkI1',
      child: child,
      options: WiredashOptionsData(
        showDebugFloatingEntryPoint: false,
        locale: Locale.fromSubtags(languageCode: languageCode),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue.withOpacity(0.9),
        secondaryColor: Colors.blue.withOpacity(0.6),
        secondaryBackgroundColor: Color(0xFF010023),
        dividerColor: Color(0xFF010023),
      ),
    );
  }
}
