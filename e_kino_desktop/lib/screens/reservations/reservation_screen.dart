import 'package:e_kino_desktop/models/projection.dart';
import 'package:e_kino_desktop/models/reservation.dart';
import 'package:e_kino_desktop/models/user.dart';

import 'package:e_kino_desktop/providers/projections_provider.dart';
import 'package:e_kino_desktop/providers/reservation_provider.dart';
import 'package:e_kino_desktop/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import '../../appbar.dart';
import '../../models/search_result.dart';
import '../../utils/util.dart';
import 'package:rxdart/rxdart.dart';

final moviesStream = BehaviorSubject<int>.seeded(-1);
late ReservationProvider _reservationProvider;
SearchResult<Reservation>? resultReservation;
late ProjectionsProvider _projectionsProvider;
SearchResult<Projection>? resultProjection;
late UsersProvider _usersProvider;
SearchResult<Users>? resultUsers;

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);
  static const String routeName = "/Reservations";

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  void initState() {
    super.initState();
    _usersProvider = context.read<UsersProvider>();
    moviesStream.add(-1);
    _reservationProvider = context.read<ReservationProvider>();
    _projectionsProvider = context.read<ProjectionsProvider>();
    _loadData();
  }

  Future<void> _loadData() async {
    var reservationData = await _reservationProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });
    var projectionData = await _projectionsProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });
    var usersData = await _usersProvider.get(filter: {
      'Page': 0,
      'PageSize': 100,
    });

    setState(() {
      resultProjection = projectionData;
      resultReservation = reservationData;
      resultUsers = usersData;
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
                  name: 'ProjectionId',
                  decoration: const InputDecoration(labelText: "Projekcija"),
                  items: resultProjection?.result
                          .map(
                            (movie) => DropdownMenuItem(
                              value: movie.projectionId.toString(),
                              child: Text(movie.movie?.title ?? ''),
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
                  name: 'UserId',
                  decoration: const InputDecoration(labelText: "User"),
                  items: resultUsers?.result
                          .map(
                            (user) => DropdownMenuItem(
                              value: user.userId.toString(),
                              child: Text(user.username ?? ''),
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
            ElevatedButton(
                onPressed: () async {
                  _formKey.currentState?.fields['UserId']?.reset();
                  _formKey.currentState?.fields['ProjectionId']?.reset();

                  var data = await _reservationProvider.get(filter: {
                    'UserId': null,
                    'ProjectionId': null,
                    'Page': 0,
                    'PageSize': 100,
                  });

                  setState(() {
                    resultReservation = data;
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
                  var data = await _reservationProvider.get(filter: {
                    'UserId':
                        _formKey.currentState?.fields['UserId']?.value != null
                            ? (_formKey.currentState?.fields['UserId']?.value)
                            : null,
                    'ProjectionId':
                        _formKey.currentState?.fields['ProjectionId']?.value,
                    'Page': 0,
                    'PageSize': 100,
                  });

                  setState(() {
                    resultReservation = data;
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
          ],
        ),
      ),
    );
  }

  Widget _buildDataListView() {
    if (resultReservation == null) {
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
                source: _DataSource(data: resultReservation!.result),
                columns: const [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Projekcija',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Korisnik',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Red',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Kolona',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Ticket',
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
  final List<Reservation> data;

  _DataSource({required this.data});
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
    String getMovieTitle(Reservation re) {
      if (resultProjection?.result != null) {
        var foundElement = resultProjection!.result.firstWhere(
          (element) => element.projectionId == re.projectionId,
          orElse: () =>
              Projection(null, DateTime.now(), null, null, null, null),
        );

        if (foundElement.movie != null) {
          return foundElement.movie!.title!;
        }
      }

      return '';
    }

    return DataRow(cells: [
      DataCell(
        Text(getMovieTitle(e)),
      ),
      DataCell(
        Text((resultUsers!.result
            .firstWhere((element) => element.userId == e.userId)
            .username!)),
      ),
      DataCell(Text(e.column!.toString())),
      DataCell(Text(e.row.toString())),
      DataCell(Text(e.numTickets.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
