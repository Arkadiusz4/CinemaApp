import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id, runtime;
  final String title, overview, releaseDate, backdropPath, posterPath;
  final num voteAverage;

  const MovieDetailEntity({
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.backdropPath,
    this.posterPath,
    this.voteAverage,
    this.runtime,
  });

  @override
  List<Object> get props => [id];
}
