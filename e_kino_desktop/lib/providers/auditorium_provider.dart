import '../models/auditorium.dart';
import 'base_provider.dart';

class AuditoriumProvider extends BaseProvider<Auditorium> {
  AuditoriumProvider() : super("Auditorium");

  @override
  Auditorium fromJson(data) {
    return Auditorium.fromJson(data);
  }
}
