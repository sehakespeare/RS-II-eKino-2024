// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_all.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportAll _$ReportAllFromJson(Map<String, dynamic> json) => ReportAll(
      (json['month'] as num?)?.toInt(),
      (json['year'] as num?)?.toInt(),
    )
      ..totalTicketsSold = (json['totalTicketsSold'] as num?)?.toInt()
      ..totalAmount = (json['totalAmount'] as num?)?.toInt();

Map<String, dynamic> _$ReportAllToJson(ReportAll instance) => <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'totalTicketsSold': instance.totalTicketsSold,
      'totalAmount': instance.totalAmount,
    };
