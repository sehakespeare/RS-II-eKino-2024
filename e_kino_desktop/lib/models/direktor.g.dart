// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direktor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Direktor _$DirektorFromJson(Map<String, dynamic> json) => Direktor(
      (json['directorId'] as num?)?.toInt(),
      json['fullName'] as String?,
      json['biography'] as String?,
      json['photo'] as String?,
      json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$DirektorToJson(Direktor instance) => <String, dynamic>{
      'directorId': instance.directorId,
      'fullName': instance.fullName,
      'biography': instance.biography,
      'photo': instance.photo,
      'isDeleted': instance.isDeleted,
    };
