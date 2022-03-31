import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MovieEntity extends Equatable {
  final String posterPath, backdropPath, title, releaseDate, overwiew;
  final int id;
  final num voteAverage;

  const MovieEntity({
    @required this.posterPath,
    @required this.backdropPath,
    @required this.id,
    @required this.overwiew,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.title,
  }) : assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;
}
