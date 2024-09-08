import 'package:e_kino_desktop/models/auditorium.dart';
import 'package:e_kino_desktop/models/movies.dart';
import 'package:e_kino_desktop/models/projection.dart';
import 'package:e_kino_desktop/providers/auditorium_provider.dart';
import 'package:e_kino_desktop/providers/movies_provider.dart';
import 'package:e_kino_desktop/providers/projections_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../appbar.dart';
import '../../models/search_result.dart';
import '../../utils/util.dart';
import 'package:rxdart/rxdart.dart';

import 'add_projection_screen.dart';

final moviesStream = BehaviorSubject<int>.seeded(-1);
late ProjectionsProvider _projectionsProvider;
SearchResult<Projection>? result;

class ProjectionScreen extends StatefulWidget {
  const ProjectionScreen({Key? key}) : super(key: key);
  static const String routeName = "/Projections";

  @override
  State<ProjectionScreen> createState() => _ProjectionScreenState();
}

class _ProjectionScreenState extends State<ProjectionScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _imePrezimeController = TextEditingController();
  late AuditoriumProvider _auditoriumProvider;
  SearchResult<Auditorium>? resultAuditoriumList;
  late MoviesProvider _moviesProvider;
  SearchResult<Movies>? resultMovie;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
    _moviesProvider = context.read<MoviesProvider>();
    moviesStream.add(-1);
    _projectionsProvider = context.read<ProjectionsProvider>();
    _auditoriumProvider = context.read<AuditoriumProvider>();
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
    var projectionData = await _projectionsProvider.get(filter: {
      'DateOfProjection': null,
      'AuditoriumId': null,
      'MovieId': null,
      'Page': 0,
      'PageSize': 100,
    });
    var auditoriumData = await _auditoriumProvider.get(filter: {
      'Name': null,
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      result = projectionData;
      resultMovie = movieData;
      resultAuditoriumList = auditoriumData;
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
        onTap: () {
          moviesStream.add(-1);
        },
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
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                height: 80,
                width: 120,
                child: FormBuilderDropdown<String>(
                  name: 'AuditoriumId',
                  decoration: const InputDecoration(labelText: "Sala"),
                  items: resultAuditoriumList?.result
                          ?.map(
                            (movie) => DropdownMenuItem(
                              value: movie.auditoriumId.toString(),
                              child: Text(movie.name ?? ''),
                            ),
                          )
                          .toList() ??
                      [],
                  enabled: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 200,
              child: FormBuilderDateTimePicker(
                name: 'DateOfProjection',
                decoration:
                    const InputDecoration(labelText: "Datum projekcije"),
                inputType: InputType.both,
                format: DateFormat('yyyy-MM-dd HH:mm'),
                enabled: true,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                onPressed: () async {
                  _formKey.currentState?.fields['AuditoriumId']?.reset();
                  _formKey.currentState?.fields['MovieId']?.reset();
                  _formKey.currentState?.fields['DateOfProjection']?.reset();
                  _imePrezimeController.clear();
                  _usernameController.clear();
                  var data = await _projectionsProvider.get(filter: {
                    'DateOfProjection': null,
                    'AuditoriumId': null,
                    'MovieId': null,
                    'Page': 0,
                    'PageSize': 100,
                  });

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
                  var data = await _projectionsProvider.get(filter: {
                    'DateOfProjection': _formKey.currentState
                                ?.fields['DateOfProjection']?.value !=
                            null
                        ? (_formKey.currentState?.fields['DateOfProjection']
                                ?.value)
                            .toIso8601String()
                        : null,
                    'AuditoriumId':
                        _formKey.currentState?.fields['AuditoriumId']?.value !=
                                null
                            ? int.parse(_formKey
                                .currentState?.fields['AuditoriumId']!.value)
                            : null,
                    'MovieId':
                        _formKey.currentState?.fields['MovieId']?.value != null
                            ? int.parse(
                                _formKey.currentState?.fields['MovieId']!.value)
                            : null,
                    'Page': 0,
                    'PageSize': 100,
                  });

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
            ElevatedButton(
              onPressed: () async {
                ProjectionData.id = null;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddProjectionScreen(
                      movies: resultMovie != null ? resultMovie!.result : [],
                      auditorium: resultAuditoriumList != null
                          ? resultAuditoriumList!.result
                          : [],
                    ),
                  ),
                );
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
                "Dodaj",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataListView() {
    if (result == null) {
      return Container();
    }

    return Expanded(
        child: SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: StreamBuilder<Object>(
            stream: moviesStream.stream,
            builder: (context, snapshot) {
              return PaginatedDataTable(
                showCheckboxColumn: false,
                headingRowColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 46, 92, 232)),
                showEmptyRows: false,
                source: _DataSource(
                  data: result!.result,
                  context: context,
                  movies: resultMovie != null ? resultMovie!.result : [],
                  auditorium: resultAuditoriumList != null
                      ? resultAuditoriumList!.result
                      : [],
                ),
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Film',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Sala',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Datum projekcije',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        '',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        '',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    ));
  }
}

class _DataSource extends DataTableSource {
  final List<Projection> data;
  final List<Movies> movies;
  List<Auditorium> auditorium;
  final BuildContext context;

  _DataSource(
      {required this.data,
      required this.context,
      required this.movies,
      required this.auditorium});
  Color _getDataRowColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected,
    };

    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.transparent;
  }

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final e = data[index];

    return DataRow(cells: [
      DataCell(
        Text(e.movie!.title.toString()),
      ),
      DataCell(Text(e.auditorium!.name.toString())),
      DataCell(Text(e.dateOfProjection.toString())),
      DataCell(
        const Text('Edit'),
        onTap: () async {
          ProjectionData.id = e.projectionId;
          ProjectionData.auditoriumId = e.auditorium?.auditoriumId;
          ProjectionData.movieId = e.movie?.movieId;
          ProjectionData.dateOfProjection = e.dateOfProjection;
          ProjectionData.price = e.ticketPrice;

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddProjectionScreen(
                movies: movies,
                auditorium: auditorium,
              ),
            ),
          );
        },
      ),
      DataCell(
        const Text('Obriši'),
        onTap: () async {
          await _projectionsProvider.delete(e.projectionId!);
          var data = await _projectionsProvider.get(filter: {
            'DateOfProjection': null,
            'AuditoriumId': null,
            'MovieId': null,
            'Page': 0,
            'PageSize': 100,
          });

          result = data;
          moviesStream.add(e.movieId!);
        },
      ),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
