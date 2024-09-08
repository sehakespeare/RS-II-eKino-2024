// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieGenre _$MovieGenreFromJson(Map<String, dynamic> json) => MovieGenre(
      (json['movieGenreId'] as num?)?.toInt(),
      (json['movieId'] as num?)?.toInt(),
      (json['genreId'] as num?)?.toInt(),
      json['genre'] == null
          ? null
          : Genre.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovieGenreToJson(MovieGenre instance) =>
    <String, dynamic>{
      'movieGenreId': instance.movieGenreId,
      'movieId': instance.movieId,
      'genreId': instance.genreId,
      'genre': instance.genre,
    };
