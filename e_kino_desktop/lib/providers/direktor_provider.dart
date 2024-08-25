import 'package:e_kino_desktop/models/direktor.dart';

import 'base_provider.dart';

class DirektorProvider extends BaseProvider<Direktor> {
  DirektorProvider() : super("Director");

  @override
  Direktor fromJson(data) {
    return Direktor.fromJson(data);
  }
}
