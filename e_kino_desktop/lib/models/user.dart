import 'package:json_annotation/json_annotation.dart';
import 'user_roles.dart';

part 'user.g.dart';

@JsonSerializable()
class Users {
  int? userId;
  String? firstName;
  String? lastName;
  String? username;
  bool? status;
  String? email;
  String? phone;
  List<UserRole>? userRoles;
  String? roleNames;
  int? spolId;
  int? radniStatusId;
  int? stepenObrazovanjaId;

  Users(
      this.userId,
      this.firstName,
      this.lastName,
      this.username,
      this.status,
      this.email,
      this.phone,
      this.spolId,
      this.radniStatusId,
      this.stepenObrazovanjaId);

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
