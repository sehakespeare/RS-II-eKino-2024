import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/reservation.dart';
import '../../models/user.dart';
import '../../providers/movies_provider.dart';
import '../../providers/projections_provider.dart';
import '../../providers/reservation_provider.dart';
import '../../providers/users_provider.dart';

class ReservationsListScreen extends StatefulWidget {
  const ReservationsListScreen({super.key});

  @override
  State<ReservationsListScreen> createState() => _ReservationsListScreenState();
}

class _ReservationsListScreenState extends State<ReservationsListScreen> {
  late ReservationProvider _reservationsProvider;
  List<Reservation>? _reservations;
  late UsersProvider _usersProvider;
  Users? _currentUser;

  String? usernameLS;

  Future<String?> _retrieveAndPrintUsernameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usernameState = prefs.getString('usernameState');
    return usernameState;
  }

  @override
  void initState() {
    super.initState();
    _retrieveAndPrintUsernameState().then((username) {
      setState(() {
        usernameLS = username;
      });
      _usersProvider = context.read<UsersProvider>();
      _fetchData();
    });
  }

  void _fetchData() async {
    final currentUser = await _usersProvider.getUsername(usernameLS ?? "");
    _currentUser = currentUser;

    try {
      _reservationsProvider =
          Provider.of<ReservationProvider>(context, listen: false);

      var data;
      if (currentUser.userId != null) {
        data = await _reservationsProvider.getByUserId(_currentUser?.userId);
      } else {
        data = null;
      }

      setState(() {
        _reservations = data?.result;
      });
    } catch (error) {
      Exception("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rezervacije',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8.0),
            Expanded(
              child: _buildDataListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataListView() {
    if (_reservations == null || _reservations!.isEmpty) {
      return const Center(
        child: Text(
          'Nemate rezervacije.',
          style: TextStyle(fontSize: 16.0),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: _reservations!.length,
        itemBuilder: (context, index) {
          final reservation = _reservations![index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              onTap: () {},
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ${reservation.reservationId}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text('Sjediste: ${reservation.row ?? 'Nepoznato'}'),
                  const SizedBox(height: 4.0),
                  Text('Broj karte: ${reservation.numTickets ?? 'Nepoznato'}'),
                  const SizedBox(height: 4.0),
                  FutureBuilder<String>(
                    future: _fetchUserName(context, reservation.userId!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(
                            'Korisnik: ${snapshot.data ?? 'Nepoznato'}');
                      }
                    },
                  ),
                  const SizedBox(height: 4.0),
                  FutureBuilder<String>(
                    future:
                        _fetchMovieTitle(context, reservation.projectionId!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(
                            'Naslov filma: ${snapshot.data ?? 'Nepoznato'}');
                      }
                    },
                  ),
                  const SizedBox(height: 4.0),
                  FutureBuilder<String>(
                    future: _fetchProjectionDate(
                        context, reservation.projectionId!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return Text(
                            'Datum i vrijeme projekcije: ${snapshot.data ?? 'Nepoznato'}');
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Future<String> _fetchUserName(BuildContext context, int userId) async {
    try {
      final user = await Provider.of<UsersProvider>(context, listen: false)
          .getById(userId);
      return user?.username ?? 'Nepoznato';
    } catch (e) {
      Exception('Greska u dohvacanju korisnickog imena: $e');
      return 'Nepoznato';
    }
  }

  Future<String> _fetchMovieTitle(
      BuildContext context, int projectionId) async {
    try {
      final projectionProvider =
          Provider.of<ProjectionsProvider>(context, listen: false);
      final projection = await projectionProvider.getById(projectionId);

      if (projection != null && projection.movieId != null) {
        final movieId = projection.movieId!;
        final movieProvider =
            Provider.of<MoviesProvider>(context, listen: false);
        final movie = await movieProvider.getById(projectionId);
        return movie?.title ?? 'Nepoznato';
      } else {
        Exception(
            'Projection or movieId not found for projection ID: $projectionId');
        return 'Nepoznato';
      }
    } catch (e) {
      Exception('Error fetching movie title: $e');
      return 'Nepoznato';
    }
  }

  Future<String> _fetchProjectionDate(
      BuildContext context, int projectionId) async {
    try {
      final projection =
          await Provider.of<ProjectionsProvider>(context, listen: false)
              .getById(projectionId);
      if (projection != null) {
        final formattedDate =
            DateFormat('dd.MM.yyyy HH:mm').format(projection.dateOfProjection);
        return formattedDate;
      } else {
        return 'Nepoznato';
      }
    } catch (e) {
      Exception('Error fetching projection date: $e');
      return 'Nepoznato';
    }
  }
}
