import 'package:json_annotation/json_annotation.dart';
part 'report.g.dart';

@JsonSerializable()
class Report {
  String? movieTitle;
  String? transactionDate;
  int? numTicketsSold;

  int? totalAmount;

  Report(this.movieTitle, this.transactionDate, this.numTicketsSold);

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
