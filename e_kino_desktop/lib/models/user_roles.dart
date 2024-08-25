import 'package:json_annotation/json_annotation.dart';

import 'role.dart';

part 'user_roles.g.dart';

@JsonSerializable()
class UserRole {
  int? userRoleId;
  int? userId;
  int? roleId;
  DateTime? dateModified;
  Role? role;

  UserRole(this.userRoleId, this.userId, this.roleId, this.dateModified);

  factory UserRole.fromJson(Map<String, dynamic> json) =>
      _$UserRoleFromJson(json);
  Map<String, dynamic> toJson() => _$UserRoleToJson(this);
}
