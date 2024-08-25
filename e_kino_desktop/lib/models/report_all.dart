import 'package:json_annotation/json_annotation.dart';
part 'report_all.g.dart';

@JsonSerializable()
class ReportAll {
  int? year;
  int? month;
  int? totalTicketsSold;
  int? totalAmount;

  ReportAll(this.month, this.year);

  factory ReportAll.fromJson(Map<String, dynamic> json) =>
      _$ReportAllFromJson(json);
  Map<String, dynamic> toJson() => _$ReportAllToJson(this);
}
