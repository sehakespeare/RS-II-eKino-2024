import '../models/user.dart';
import 'base_provider.dart';

class UsersProvider extends BaseProvider<Users> {
  UsersProvider() : super("User");

  @override
  Users fromJson(data) {
    return Users.fromJson(data);
  }
}
