import '../models/genre.dart';
import 'base_provider.dart';

class GenreProvider extends BaseProvider<Genre> {
  GenreProvider() : super("Genre");

  @override
  Genre fromJson(data) {
    return Genre.fromJson(data);
  }
}
