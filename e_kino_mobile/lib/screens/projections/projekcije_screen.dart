import 'package:e_kino_mobile/models/movies.dart';
import 'package:e_kino_mobile/models/projection.dart';
import 'package:e_kino_mobile/models/search_result.dart';
import 'package:e_kino_mobile/providers/projections_provider.dart';
import 'package:e_kino_mobile/screens/drawer_navigation.dart';
import 'package:e_kino_mobile/screens/projections/projection_details_screen.dart';
import 'package:e_kino_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../../providers/users_provider.dart';

class ProjekcijeScreen extends StatefulWidget {
  const ProjekcijeScreen({super.key});

  @override
  _ProjekcijeScreenState createState() => _ProjekcijeScreenState();
}

class _ProjekcijeScreenState extends State<ProjekcijeScreen> {
  late ProjectionsProvider _projectionsProvider;
  SearchResult<Projection>? _projections;

  final TextEditingController _searchController = TextEditingController();
  Users? _currentUser;
  late UsersProvider _usersProvider;
  String? usernameFromPrefs;

  Future<String?> _retrieveUsernameFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? usernameState = prefs.getString('usernameState');
    return usernameState;
  }

  @override
  void initState() {
    super.initState();
    _projectionsProvider = context.read<ProjectionsProvider>();
    _retrieveUsernameFromPrefs().then((username) {
      setState(() {
        usernameFromPrefs = username;
      });
    });
    _loadProjections();
    _usersProvider = context.read<UsersProvider>();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadProjections() async {
    var data = await _projectionsProvider.get();
    final currentUser =
        await _usersProvider.getUsername(usernameFromPrefs ?? "");

    setState(() {
      _projections = data;
      _currentUser = currentUser;
      CartRouteData.user = _currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Projekcije',
          style: TextStyle(fontSize: 18),
        ),
      ),
      drawer: const DrawerNavigation(),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              'Predstojeće projekcije',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          _createUpcomingDataListView(),
          const SizedBox(
            height: 8,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Text(
              'Prošle projekcije',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          _createDataListView(),
        ],
      ),
    );
  }

  Widget _createDataListView() {
    return (_projections?.result.isNotEmpty ?? false)
        ? GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: _projections?.result
                .where((element) =>
                    element.dateOfProjection.isBefore(DateTime.now()))
                .length,
            itemBuilder: (ctx, i) {
              List<Projection> projections = [];
              for (var element in _projections!.result) {
                if (element.dateOfProjection.isBefore(DateTime.now())) {
                  projections.add(element);
                }
              }
              return _createCard(i, projections, true);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 2,
              mainAxisExtent: 350,
            ),
          )
        : const Center(child: Text("Učitavanje podataka..."));
  }

  Widget _createUpcomingDataListView() {
    return (_projections?.result.isNotEmpty ?? false)
        ? GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: _projections?.result
                .where((element) =>
                    element.dateOfProjection.isAfter(DateTime.now()))
                .length,
            itemBuilder: (ctx, i) {
              List<Projection> projections = [];
              for (var element in _projections!.result) {
                if (element.dateOfProjection.isAfter(DateTime.now())) {
                  projections.add(element);
                }
              }
              return _createCard(i, projections, false);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 2,
              mainAxisExtent: 350,
            ),
          )
        : const Center(child: Text("Učitavanje podataka..."));
  }

  Widget _createCard(
      int index, List<Projection> projections, bool isPastProjection) {
    final Projection projection = projections[index];
    final Movies? movieDetails = projection.movie;

    // if (!projection.dateOfProjection.isBefore(DateTime.now())) {
    //   return Container();
    // }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProjectionDetailsScreen(
              projection: projection,
              isPastProjection: isPastProjection,
            ),
          ),
        );
      },
      child: Card(
        color: const Color.fromARGB(122, 152, 202, 224),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: imageFromBase64String(movieDetails?.photo ?? ""),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${movieDetails?.title}",
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${movieDetails?.description}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Trajanje: ${movieDetails?.runningTime}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
