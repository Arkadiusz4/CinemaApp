import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationListItem(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent.withOpacity(0.5),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final Function onPressed;

  const NavigationSubListItem(
      {Key key, @required this.title, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent.withOpacity(0.5),
              blurRadius: 2,
            ),
          ],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 30),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
