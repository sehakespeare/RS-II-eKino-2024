import 'dart:convert';

import 'package:e_kino_mobile/models/transaction.dart';
import 'package:e_kino_mobile/providers/base_provider.dart';

class TransactionProvider extends BaseProvider<Transaction> {
  TransactionProvider() : super("Transaction");

  @override
  Transaction fromJson(data) {
    return Transaction.fromJson(data);
  }

  Future<dynamic> placanje(Map<dynamic, dynamic> transakcija) async {
    var url = "$fullUrl";
    var uri = Uri.parse(url);
    var jsonRequest = jsonEncode(transakcija);
    var headers = createHeaders();
    var response = await http!.post(uri, headers: headers, body: jsonRequest);
    if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      Transaction list = fromJson(data);
      return list;
    } else {
      throw Exception("Error");
    }
  }
}
