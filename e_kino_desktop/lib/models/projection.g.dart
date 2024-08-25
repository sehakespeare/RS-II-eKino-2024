// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projection _$ProjectionFromJson(Map<String, dynamic> json) => Projection(
      (json['projectionId'] as num?)?.toInt(),
      DateTime.parse(json['dateOfProjection'] as String),
      (json['movieId'] as num?)?.toInt(),
      json['auditorium'] == null
          ? null
          : Auditorium.fromJson(json['auditorium'] as Map<String, dynamic>),
      json['movie'] == null
          ? null
          : Movies.fromJson(json['movie'] as Map<String, dynamic>),
      (json['ticketPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProjectionToJson(Projection instance) =>
    <String, dynamic>{
      'projectionId': instance.projectionId,
      'dateOfProjection': instance.dateOfProjection.toIso8601String(),
      'auditorium': instance.auditorium,
      'movieId': instance.movieId,
      'movie': instance.movie,
      'ticketPrice': instance.ticketPrice,
    };
