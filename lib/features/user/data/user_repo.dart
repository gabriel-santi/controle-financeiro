import '../domain/user.dart';

abstract class UserRepository {
  Future<User> getUser();

  Future<void> saveUser(User user);
}
