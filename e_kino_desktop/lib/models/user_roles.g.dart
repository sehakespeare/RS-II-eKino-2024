// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRole _$UserRoleFromJson(Map<String, dynamic> json) => UserRole(
      (json['userRoleId'] as num?)?.toInt(),
      (json['userId'] as num?)?.toInt(),
      (json['roleId'] as num?)?.toInt(),
      json['dateModified'] == null
          ? null
          : DateTime.parse(json['dateModified'] as String),
    )..role = json['role'] == null
        ? null
        : Role.fromJson(json['role'] as Map<String, dynamic>);

Map<String, dynamic> _$UserRoleToJson(UserRole instance) => <String, dynamic>{
      'userRoleId': instance.userRoleId,
      'userId': instance.userId,
      'roleId': instance.roleId,
      'dateModified': instance.dateModified?.toIso8601String(),
      'role': instance.role,
    };
