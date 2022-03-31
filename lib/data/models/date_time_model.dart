import 'package:flutter/cupertino.dart';

class DateTimeModel {
  final String day, number, month;

  DateTimeModel({
    @required this.day,
    @required this.number,
    @required this.month,
  });

  static List<DateTimeModel> listDate = [
    DateTimeModel(day: 'Wed', number: '29', month: 'December'),
    DateTimeModel(day: 'Thu', number: '30', month: 'December'),
    DateTimeModel(day: 'Fri', number: '31', month: 'December'),
    DateTimeModel(day: 'Sat', number: '1', month: 'January'),
    DateTimeModel(day: 'Sun', number: '2', month: 'January'),
    DateTimeModel(day: 'Mon', number: '3', month: 'January'),
  ];

  static List<String> listTime = [
    '9:00',
    '10:30',
    '12:00',
    '13:30',
    '15:00',
    '16:30',
    '18:00',
    '19:30',
    '21:00',
  ];
}
