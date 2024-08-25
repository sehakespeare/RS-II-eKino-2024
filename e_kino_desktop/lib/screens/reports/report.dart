import 'package:e_kino_desktop/models/movies.dart';

import 'package:e_kino_desktop/providers/movies_provider.dart';

import 'package:e_kino_desktop/providers/report_provider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:provider/provider.dart';

import '../../appbar.dart';

import '../../models/search_result.dart';

import '../../utils/util.dart';

late ReportProvider _reportProvider;
dynamic result;

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);
  static const String routeName = "/Reports |";

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late List<ChartData> chartData;
  late MoviesProvider _moviesProvider;
  SearchResult<Movies>? resultMovie;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
    _moviesProvider = context.read<MoviesProvider>();

    _reportProvider = context.read<ReportProvider>();

    _loadData();
  }

  Future<void> _loadData() async {
    var movieData = await _moviesProvider.get(filter: {
      'Title': null,
      'Year': null,
      'DirectorId': null,
      'Page': 0,
      'PageSize': 100,
    });
    var projectionData = await _reportProvider.getReportById(0);

    setState(() {
      result = projectionData;
      resultMovie = movieData;
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
      body: InkWell(
        onTap: () {},
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSearch(),
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
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilder(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                height: 80,
                width: 120,
                child: FormBuilderDropdown<String>(
                  name: 'MovieId',
                  decoration: const InputDecoration(labelText: "Film"),
                  items: resultMovie?.result
                          ?.map(
                            (movie) => DropdownMenuItem(
                              value: movie.movieId.toString(),
                              child: Text(movie.title ?? ''),
                            ),
                          )
                          .toList() ??
                      [],
                  enabled: true,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(width: 8),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  _formKey.currentState?.fields['MovieId']?.reset();

                  var data = await _reportProvider.getReportById(0);

                  setState(() {
                    result = data;
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 46, 92, 232)),
                ),
                child: const Text(
                  "Očisti",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 8),
            ElevatedButton(
                onPressed: () async {
                  var data = await _reportProvider.getReportById(
                    _formKey.currentState?.fields['MovieId']?.value != null
                        ? int.parse(
                            _formKey.currentState?.fields['MovieId']!.value)
                        : 10,
                  );

                  setState(() {
                    result = data;
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 46, 92, 232)),
                ),
                child: const Text(
                  "Pretraži",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildDataListView() {
    if (result == null) {
      return Container();
    }
    if (result is List) {
      chartData = result
          .map<ChartData>((item) => ChartData(
                DateFormat('dd.MM.yyyy')
                    .format(DateTime.parse(item.transactionDate))
                    .toString(),
                (item.totalAmount as num).toDouble(),
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
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Center(child: Text(result.toString())),
                  ),
                ],
              )
            : Container(
                color: Colors.white,
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <CartesianSeries<ChartData, String>>[
                    LineSeries<ChartData, String>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    )
                  ],
                ),
              ),
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
