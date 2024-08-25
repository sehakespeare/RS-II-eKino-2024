import 'package:json_annotation/json_annotation.dart';
part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  int? userId;
  int? reservationId;
  DateTime? dateOfTransaction;
  double? amount;

  Transaction(
    this.userId,
    this.reservationId,
    this.dateOfTransaction,
    this.amount,
  );

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
