import 'dart:convert';

import 'package:e_kino_desktop/models/report.dart';
import 'package:e_kino_desktop/models/report_all.dart';

import 'base_provider.dart';

class ReportProvider extends BaseProvider<Report> {
  ReportProvider() : super("Report");

  @override
  Report fromJson(data) {
    return Report.fromJson(data);
  }

  Future<dynamic> getReportById(int id) async {
    var url = "$fullUrl/ticket-sales/$id";
    var uri = Uri.parse(url);

    Map<String, String> headers = createHeaders();
    var response = await http!.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 404) {
      var data = (response.body);

      return (data.toString());
    } else if (isValidResponse(response)) {
      var data = jsonDecode(response.body);
      List<Report> recenzija = [];
      for (var element in data) {
        recenzija.add(fromJson(element));
      }
      return recenzija;
    } else {
      throw Exception("Wrong username or password");
    }
  }
}
