import 'dart:convert';

import 'package:e_kino_desktop/models/report_all.dart';

import 'base_provider.dart';

class ReportAllProvider extends BaseProvider<ReportAll> {
  ReportAllProvider() : super("Report");

  @override
  ReportAll fromJson(data) {
    return ReportAll.fromJson(data);
  }

  Future<dynamic> getReports() async {
    var url = "$fullUrl/monthly-sales-report";
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
      List<ReportAll> recenzija = [];
      for (var element in data) {
        recenzija.add(fromJson(element));
      }
      return recenzija;
    } else {
      throw Exception("Wrong username or password");
    }
  }
}
