import 'package:e_kino_mobile/providers/recommender_provider.dart';
import 'package:e_kino_mobile/screens/user_profile/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_kino_mobile/providers/auditorium_provider.dart';
import 'package:e_kino_mobile/providers/movies_provider.dart';
import 'package:e_kino_mobile/providers/projections_provider.dart';
import 'package:e_kino_mobile/providers/rating_provider.dart';
import 'package:e_kino_mobile/providers/reservation_provider.dart';
import 'package:e_kino_mobile/providers/transaction_provider.dart';
import 'package:e_kino_mobile/providers/users_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ChangeNotifierProvider(create: (_) => ProjectionsProvider()),
      ChangeNotifierProvider(create: (_) => ReservationProvider()),
      ChangeNotifierProvider(create: (_) => UsersProvider()),
      ChangeNotifierProvider(create: (_) => TransactionProvider()),
      ChangeNotifierProvider(create: (_) => AuditoriumProvider()),
      ChangeNotifierProvider(create: (_) => RatingProvider()),
      ChangeNotifierProvider(create: (_) => RecommenderProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepPurple,
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic))),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        ),
      ),
      home: LoginScreen(),
    ),
  ));
}
