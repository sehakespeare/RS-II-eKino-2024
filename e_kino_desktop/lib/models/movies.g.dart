// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      (json['movieId'] as num?)?.toInt(),
      json['title'] as String?,
      json['description'] as String?,
      (json['year'] as num?)?.toInt(),
      (json['runningTime'] as num?)?.toInt(),
      json['photo'] as String?,
      (json['directorId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'movieId': instance.movieId,
      'title': instance.title,
      'description': instance.description,
      'year': instance.year,
      'runningTime': instance.runningTime,
      'photo': instance.photo,
      'directorId': instance.directorId,
    };
