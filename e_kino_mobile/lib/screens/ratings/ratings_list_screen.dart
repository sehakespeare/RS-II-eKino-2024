import 'package:e_kino_mobile/models/rating.dart';
import 'package:e_kino_mobile/providers/rating_provider.dart';
import 'package:e_kino_mobile/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utils/util.dart';

class RatingsListScreen extends StatefulWidget {
  final int movieId;
  final String? photo;
  final String? title;
  const RatingsListScreen(
      {super.key, required this.movieId, required this.photo, this.title});

  @override
  State<RatingsListScreen> createState() => _RatingsListScreenState();
}

class _RatingsListScreenState extends State<RatingsListScreen> {
  late RatingProvider _ratingProvider;
  List<Rating>? _rating;
  late UsersProvider _usersProvider;
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

    try {
      _ratingProvider = Provider.of<RatingProvider>(context, listen: false);

      dynamic data;
      if (currentUser.userId != null) {
        data = await _ratingProvider.get(filter: {
          'UserId': currentUser.userId,
          'MovieId': widget.movieId,
        });
      } else {
        data = null;
      }

      setState(() {
        _rating = data?.result;
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
          'Ocjene',
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
    return ListView.builder(
      itemCount: _rating?.length ?? 0,
      itemBuilder: (context, index) {
        final ratingItem = _rating![index];
        return Column(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120,
                      width: 100,
                      child: imageFromBase64String(widget.photo ?? ""),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(widget.title!),
                  ],
                ),
                RatingBar(
                  itemSize: 20,
                  maxRating: 5,
                  minRating: 1,
                  ignoreGestures: true,
                  initialRating: ratingItem.value!.toDouble(),
                  allowHalfRating: false,
                  ratingWidget: RatingWidget(
                    full: const Icon(Icons.star,
                        color: Color.fromARGB(255, 253, 190, 0)),
                    half: const Icon(Icons.star,
                        color: Color.fromARGB(255, 253, 190, 0)),
                    empty: const Icon(Icons.star, color: Colors.grey),
                  ),
                  onRatingUpdate: (rate) {},
                ),
              ],
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
