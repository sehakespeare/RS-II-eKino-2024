import 'package:e_kino_desktop/models/report.dart';
import 'package:e_kino_desktop/providers/direktor_provider.dart';
import 'package:e_kino_desktop/providers/genre_provider.dart';
import 'package:e_kino_desktop/providers/report_all_provider.dart';
import 'package:e_kino_desktop/providers/report_provider.dart';
import 'package:e_kino_desktop/screens/auditoriums/auditoriums_screen.dart';
import 'package:e_kino_desktop/screens/direktors/direktors_screen.dart';
import 'package:e_kino_desktop/screens/movies/movies_screen.dart';
import 'package:e_kino_desktop/screens/projection/projection_screen.dart';
import 'package:e_kino_desktop/screens/reports/report.dart';
import 'package:e_kino_desktop/screens/reports/report_all.dart';
import 'package:e_kino_desktop/screens/reservations/reservation_screen.dart';
import 'package:e_kino_desktop/screens/user_profile/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auditorium_provider.dart';
import 'providers/movies_provider.dart';
import 'providers/projections_provider.dart';
import 'providers/reservation_provider.dart';
import 'providers/users_provider.dart';
import 'screens/genre/genre_screen.dart';
import 'screens/user_profile/login_screen.dart';

//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MoviesProvider()),
      ChangeNotifierProvider(create: (_) => ProjectionsProvider()),
      ChangeNotifierProvider(create: (_) => ReservationProvider()),
      ChangeNotifierProvider(create: (_) => UsersProvider()),
      ChangeNotifierProvider(create: (_) => DirektorProvider()),
      ChangeNotifierProvider(create: (_) => AuditoriumProvider()),
      ChangeNotifierProvider(create: (_) => ReportProvider()),
      ChangeNotifierProvider(create: (_) => GenreProvider()),
      ChangeNotifierProvider(create: (_) => ReportAllProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == AuditoriumScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => const AuditoriumScreen()));
        }
        if (settings.name == UsersScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const UsersScreen()),
          );
        }
        if (settings.name == GenreScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => const GenreScreen()));
        }
        if (settings.name == MoviesScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const MoviesScreen()),
          );
        }
        if (settings.name == DirektorsScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const DirektorsScreen()),
          );
        }
        if (settings.name == ProjectionScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const ProjectionScreen()),
          );
        }
        if (settings.name == ReservationScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const ReservationScreen()),
          );
        }
        if (settings.name == ReportAllScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => const ReportAllScreen()),
          );
        }
        if (settings.name == LoginScreen.routeName) {
          return MaterialPageRoute(
            builder: ((context) => LoginScreen()),
          );
        }
        return MaterialPageRoute(
          builder: ((context) => const ReportScreen()),
        );
      },
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
