import 'package:e_kino_mobile/models/movies.dart';

import 'package:e_kino_mobile/models/search_result.dart';

import 'package:e_kino_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/recommender_provider.dart';

class PreporukeScreen extends StatefulWidget {
  const PreporukeScreen({super.key});

  @override
  _PreporukeScreenState createState() => _PreporukeScreenState();
}

class _PreporukeScreenState extends State<PreporukeScreen> {
  late RecommenderProvider _recommenderProvider;
  SearchResult<Movies>? _recommenderMovies;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _recommenderProvider = context.read<RecommenderProvider>();

    initForm();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> initForm() async {
    var data = await _recommenderProvider
        .getRecommenderByUserId(CartRouteData.user?.userId ?? 0);

    setState(() {
      _recommenderMovies = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Preporuke',
          style: TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          _createDataListView(),
        ],
      ),
    );
  }

  Widget _createDataListView() {
    return Expanded(
      child: SingleChildScrollView(
          child: (_recommenderMovies?.result.isNotEmpty ?? false)
              ? GridView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: _recommenderMovies?.result.length,
                  itemBuilder: (ctx, i) {
                    return _createCard(i);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 2,
                    mainAxisExtent: 350,
                  ),
                )
              : const Center(child: Text("Učitavanje podataka..."))),
    );
  }

  Widget _createCard(int index) {
    final Movies movie = _recommenderMovies!.result[index];

    if (movie.movieId == null) {
      return Container();
    }

    return Card(
      color: const Color.fromARGB(122, 152, 202, 224),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: imageFromBase64String(movie.photo ?? ""),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${movie.title}",
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
              "${movie.description}",
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
              "Trajanje: ${movie.runningTime}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
