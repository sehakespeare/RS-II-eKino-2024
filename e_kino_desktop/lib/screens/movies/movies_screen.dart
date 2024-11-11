import 'package:e_kino_desktop/models/movies.dart';
import 'package:e_kino_desktop/providers/movies_provider.dart';
import 'package:e_kino_desktop/screens/movies/add_movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../appbar.dart';
import '../../models/direktor.dart';
import '../../models/genre.dart';
import '../../models/search_result.dart';

import '../../providers/direktor_provider.dart';
import '../../providers/genre_provider.dart';
import '../../utils/util.dart';
import 'package:rxdart/rxdart.dart';

final moviesStream = BehaviorSubject<int>.seeded(-1);
late MoviesProvider _moviesProvider;
SearchResult<Movies>? result;

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);
  static const String routeName = "/Movies";

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _imePrezimeController = TextEditingController();
  late DirektorProvider _direktorProvider;
  SearchResult<Direktor>? resultDirectorList;
  late GenreProvider _genreProvider;
  SearchResult<Genre>? resultGenreList;
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
    _moviesProvider = context.read<MoviesProvider>();
    moviesStream.add(-1);
    _direktorProvider = context.read<DirektorProvider>();
    _genreProvider = context.read<GenreProvider>();
    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _moviesProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });
    var directorData = await _direktorProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });
    var genreData = await _genreProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      result = data;
      resultDirectorList = directorData;
      resultGenreList = genreData;
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: "Naslov"),
                  controller: _usernameController,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 200,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: "Godina"),
                  controller: _imePrezimeController,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const SizedBox(width: 8),
          ElevatedButton(
              onPressed: () async {
                _imePrezimeController.clear();
                _usernameController.clear();
                var data = await _moviesProvider.get(filter: {
                  'Title': null,
                  'Year': null,
                  'DirectorId': null,
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
                var data = await _moviesProvider.get(filter: {
                  'Title': _usernameController.text,
                  'Year': _imePrezimeController.text != ''
                      ? int.parse(_imePrezimeController.text)
                      : null,
                  'DirectorId': null,
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddMovieScreen(
                    data: resultDirectorList != null
                        ? resultDirectorList!.result
                        : [],
                    genre:
                        resultGenreList != null ? resultGenreList!.result : [],
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
                  directorList: resultDirectorList != null
                      ? resultDirectorList!.result
                      : [],
                  genreList:
                      resultGenreList != null ? resultGenreList!.result : [],
                ),
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Naslov',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Godina',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Trajanje',
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
  final List<Movies> data;
  final BuildContext context;
  final List<Direktor> directorList;
  final List<Genre> genreList;

  _DataSource(
      {required this.data,
      required this.context,
      required this.directorList,
      required this.genreList});

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }

    final e = data[index];

    return DataRow(cells: [
      DataCell(
        Text(e.title.toString()),
      ),
      DataCell(Text(e.year.toString())),
      DataCell(Text(e.runningTime.toString())),
      DataCell(
        const Text('Edit'),
        onTap: () async {
          List<int> movieGenreIdList = [];

          var directorFullName = directorList
              .firstWhere((element) => element.directorId == e.directorId)
              .fullName!;
          if (e.movieGenres != null) {
            for (var element in e.movieGenres!) {
              movieGenreIdList.add(element.genreId!);
            }
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddMovieScreen(
                data: directorList,
                genre: genreList,
                id: e.movieId,
                year: e.year,
                title: e.title,
                description: e.description,
                directorId: e.directorId,
                runningTime: e.runningTime.toString(),
                photo: e.photo,
                directorFullName: directorFullName,
                movieGenreIdList: movieGenreIdList,
              ),
            ),
          );
        },
      ),
      DataCell(const Text('Obriši'), onTap: () async {
        bool? confirmDelete = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Potvrda brisanja"),
              content: const Text(
                  "Da li ste sigurni da želite obrisati ovaj podatak?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    "Odustani",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    "Obriši",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          },
        );
        if (confirmDelete == true) {
          await _moviesProvider.delete(e.movieId!);
          var data = await _moviesProvider.get(filter: {
            'Title': null,
            'Year': null,
            'DirectorId': null,
            'Page': 0,
            'PageSize': 100,
          });

          result = data;
          moviesStream.add(e.movieId!);
        }
        ;
      }),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
