import 'package:json_annotation/json_annotation.dart';
part 'direktor.g.dart';

@JsonSerializable()
class Direktor {
  int? directorId;
  String? fullName;
  String? biography;
  String? photo;
  bool? isDeleted;

  Direktor(this.directorId, this.fullName, this.biography, this.photo,
      this.isDeleted);

  factory Direktor.fromJson(Map<String, dynamic> json) =>
      _$DirektorFromJson(json);
  Map<String, dynamic> toJson() => _$DirektorToJson(this);
}
