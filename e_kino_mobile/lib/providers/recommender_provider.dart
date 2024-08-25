import 'package:e_kino_mobile/models/movies.dart';
import 'package:e_kino_mobile/providers/base_provider.dart';

class RecommenderProvider extends BaseProvider<Movies> {
  RecommenderProvider() : super("Movie/recommender");

  @override
  Movies fromJson(data) {
    return Movies.fromJson(data);
  }
}
