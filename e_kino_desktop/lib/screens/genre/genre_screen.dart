import 'package:e_kino_desktop/models/genre.dart';

import 'package:e_kino_desktop/providers/genre_provider.dart';

import 'package:e_kino_desktop/screens/genre/add_genre.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../appbar.dart';
import '../../models/search_result.dart';

import '../../utils/util.dart';
import 'package:rxdart/rxdart.dart';

final genreStream = BehaviorSubject<int>.seeded(-1);
late GenreProvider _genreProvider;
SearchResult<Genre>? result;

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key? key}) : super(key: key);
  static const String routeName = "/Genres";

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _genreProvider = context.read<GenreProvider>();
    genreStream.add(-1);

    _loadData();
  }

  Future<void> _loadData() async {
    var data = await _genreProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      result = data;
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
          genreStream.add(-1);
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
                  decoration: const InputDecoration(labelText: "Name"),
                  controller: _nameController,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          ElevatedButton(
              onPressed: () async {
                _nameController.clear();

                var data = await _genreProvider.get(filter: {
                  'Name': _nameController.text,
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
                var data = await _genreProvider.get(filter: {
                  'Name': _nameController.text,
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
                  builder: (context) => const AddGenreScreen(),
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
            stream: genreStream.stream,
            builder: (context, snapshot) {
              return PaginatedDataTable(
                showCheckboxColumn: false,
                headingRowColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 46, 92, 232)),
                showEmptyRows: false,
                source: _DataSource(data: result!.result, context: context),
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Name',
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
  final List<Genre> data;
  final BuildContext context;

  _DataSource({required this.data, required this.context});
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
        Text('${e.name.toString()}'),
      ),
      DataCell(
        const Text('Edit'),
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddGenreScreen(
                id: e.genreId,
                name: e.name,
              ),
            ),
          );
        },
      ),
      DataCell(const Text('Delete'), onTap: () async {
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
          await _genreProvider.delete(e.genreId!);
          var data = await _genreProvider.get(filter: {
            'ImePrezime': null,
            'UlogaId': null,
            'Page': 0,
            'PageSize': 100,
          });

          result = data;
          genreStream.add(e.genreId!);
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
