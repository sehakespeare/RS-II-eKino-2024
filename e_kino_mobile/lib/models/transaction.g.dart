// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      (json['userId'] as num?)?.toInt(),
      (json['reservationId'] as num?)?.toInt(),
      json['dateOfTransaction'] == null
          ? null
          : DateTime.parse(json['dateOfTransaction'] as String),
      (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'reservationId': instance.reservationId,
      'dateOfTransaction': instance.dateOfTransaction?.toIso8601String(),
      'amount': instance.amount,
    };
