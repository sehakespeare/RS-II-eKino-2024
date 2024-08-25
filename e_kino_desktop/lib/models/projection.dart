import 'package:e_kino_desktop/models/auditorium.dart';

import 'package:json_annotation/json_annotation.dart';

import 'movies.dart';
part 'projection.g.dart';

@JsonSerializable()
class Projection {
  int? projectionId;
  DateTime dateOfProjection;
  Auditorium? auditorium;
  int? movieId;
  Movies? movie;
  double? ticketPrice;

  Projection(
    this.projectionId,
    this.dateOfProjection,
    this.movieId,
    this.auditorium,
    this.movie,
    this.ticketPrice,
  );

  factory Projection.fromJson(Map<String, dynamic> json) =>
      _$ProjectionFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectionToJson(this);
}
