import '../models/movies.dart';
import 'base_provider.dart';

class MoviesProvider extends BaseProvider<Movies> {
  MoviesProvider() : super("Movie");

  @override
  Movies fromJson(data) {
    return Movies.fromJson(data);
  }
}
