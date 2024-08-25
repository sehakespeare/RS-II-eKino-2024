// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      (json['genreId'] as num?)?.toInt(),
      json['name'] as String?,
      json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'genreId': instance.genreId,
      'name': instance.name,
      'isDeleted': instance.isDeleted,
    };
