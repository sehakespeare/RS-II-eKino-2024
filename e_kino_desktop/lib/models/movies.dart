import 'package:e_kino_desktop/models/genre.dart';
import 'package:e_kino_desktop/models/movie_genre.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movies.g.dart';

@JsonSerializable()
class Movies {
  int? movieId;
  String? title;
  String? description;
  int? year;
  int? runningTime;
  String? photo;
  int? directorId;
  List<MovieGenre>? movieGenres;

  Movies(this.movieId, this.title, this.description, this.year,
      this.runningTime, this.photo, this.directorId, this.movieGenres);

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
