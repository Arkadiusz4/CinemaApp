import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class DateTimeEntity extends Equatable {
  final String date, time;

  DateTimeEntity({
    @required this.date,
    @required this.time,
  });

  @override
  
  List<Object> get props => [date, time];
}
