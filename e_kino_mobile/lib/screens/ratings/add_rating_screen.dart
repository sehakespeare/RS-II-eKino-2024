import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../providers/rating_provider.dart';

class RatingScreen extends StatefulWidget {
  final int userId;
  final int movieId;
  const RatingScreen({Key? key, required this.movieId, required this.userId})
      : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  late RatingProvider _ratingsProvider;

  int? rating = 3;

  @override
  void initState() {
    super.initState();
    _ratingsProvider = Provider.of<RatingProvider>(context, listen: false);
  }

  dynamic existingRating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dodaj ocjenu",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Ocjena:',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          RatingBar(
                            itemSize: 40,
                            maxRating: 5,
                            minRating: 1,
                            initialRating: 3,
                            allowHalfRating: false,
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star,
                                  color: Color.fromARGB(255, 253, 190, 0)),
                              half: const Icon(Icons.star,
                                  color: Color.fromARGB(255, 253, 190, 0)),
                              empty: const Icon(Icons.star, color: Colors.grey),
                            ),
                            onRatingUpdate: (rate) {
                              rating = rate.toInt();
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  final int value = rating ?? 0;

                                  _saveRating(
                                      widget.userId, widget.movieId, value);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Ocjeni film",
                                    style: TextStyle(color: Colors.blue)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveRating(int userId, int movieId, int value) async {
    final ratingData = {
      'userId': userId,
      'movieId': movieId,
      'value': value,
    };

    try {
      await _ratingsProvider.insert(ratingData);

      Fluttertoast.showToast(msg: 'Ocjena uspješno dodana');
    } catch (error) {
      Fluttertoast.showToast(msg: 'Greška prilikom dodavanja ocjene');
    }
  }
}
