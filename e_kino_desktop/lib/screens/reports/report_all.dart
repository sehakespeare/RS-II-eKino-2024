import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../appbar.dart';

import '../../providers/report_all_provider.dart';
import '../../utils/util.dart';

late ReportAllProvider _reportAllProvider;
dynamic result;

class ReportAllScreen extends StatefulWidget {
  const ReportAllScreen({Key? key}) : super(key: key);
  static const String routeName = "/Reports ||";

  @override
  State<ReportAllScreen> createState() => _ReportAllScreenState();
}

class _ReportAllScreenState extends State<ReportAllScreen> {
  late List<_ChartData> chartData;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();

    _reportAllProvider = context.read<ReportAllProvider>();
    _tooltip = TooltipBehavior(enable: true);
    _loadData();
  }

  Future<void> _loadData() async {
    var projectionData = await _reportAllProvider.getReports();

    setState(() {
      result = projectionData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      appBar: AppBar(
        leading: const SingleChildScrollView(
          child: Row(children: [
            SizedBox(
              height: 600,
              width: 1000,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: AppBarWidget(),
              ),
            ),
          ]),
        ),
        leadingWidth: 1000,
        backgroundColor: const Color.fromARGB(255, 23, 121, 251),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    "/Login",
                  );
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal),
                )),
          )
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            _buildDataListView(),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Loged in as ${Authorization.username}",
                      style: const TextStyle(color: Colors.black),
                    )),
              ],
            ),
          ]),
    );
  }

  Widget _buildDataListView() {
    if (result == null) {
      return Container();
    }
    if (result is List) {
      chartData = result
          .map<_ChartData>((item) => _ChartData(
                '${item.month}.${item.year}',
                item.totalTicketsSold,
              ))
          .toList();
    } else {
      chartData = [];
    }

    return Expanded(
        child: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: (result is String)
            ? Text(result.toString())
            : Container(
                color: Colors.white,
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis:
                        NumericAxis(minimum: 0, maximum: 40, interval: 10),
                    tooltipBehavior: _tooltip,
                    series: <CartesianSeries<_ChartData, String>>[
                      ColumnSeries<_ChartData, String>(
                          dataSource: chartData,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'Gold',
                          color: Color.fromARGB(255, 0, 0, 0))
                    ])),
      ),
    ));
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final int y;
}
