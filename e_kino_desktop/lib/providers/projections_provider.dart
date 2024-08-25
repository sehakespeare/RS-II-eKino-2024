import '../models/projection.dart';
import 'base_provider.dart';

class ProjectionsProvider extends BaseProvider<Projection> {
  ProjectionsProvider() : super("Projection");

  @override
  Projection fromJson(data) {
    return Projection.fromJson(data);
  }
}
