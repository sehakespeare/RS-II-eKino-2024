import 'package:e_kino_desktop/models/genre.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_genre.g.dart';

@JsonSerializable()
class MovieGenre {
  int? movieGenreId;
  int? movieId;
  int? genreId;
  Genre? genre;

  MovieGenre(
    this.movieGenreId,
    this.movieId,
    this.genreId,
    this.genre,
  );

  factory MovieGenre.fromJson(Map<String, dynamic> json) =>
      _$MovieGenreFromJson(json);
  Map<String, dynamic> toJson() => _$MovieGenreToJson(this);
}
