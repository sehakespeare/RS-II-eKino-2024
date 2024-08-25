// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      json['movieTitle'] as String?,
      json['transactionDate'] as String?,
      (json['numTicketsSold'] as num?)?.toInt(),
    )..totalAmount = (json['totalAmount'] as num?)?.toInt();

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'movieTitle': instance.movieTitle,
      'transactionDate': instance.transactionDate,
      'numTicketsSold': instance.numTicketsSold,
      'totalAmount': instance.totalAmount,
    };
