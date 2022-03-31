import 'package:cinema/data/models/date_time_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDate extends StatelessWidget {
  final DateTimeModel date;

  const ItemDate({
    Key key,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView.builder(
        itemCount: date,
        itemBuilder: (context, index) {
          return date[index];
        },
      ),
    );
  }
}
