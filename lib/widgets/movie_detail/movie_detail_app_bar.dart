import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MovieDetailAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }
}
