import 'package:json_annotation/json_annotation.dart';
part 'genre.g.dart';

@JsonSerializable()
class Genre {
  int? genreId;
  String? name;
  bool? isDeleted;

  Genre(this.genreId, this.name, this.isDeleted);

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
