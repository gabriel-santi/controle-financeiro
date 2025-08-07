import 'package:finapp/features/user/data/user_dao.dart';

import '../domain/user.dart';

abstract class UserRepo {
  Future<User?> getUser();

  Future<User> saveUser(User user);
}

class UserSqliteRepo extends UserRepo {
  final UserDao _dao = UserDao();

  @override
  Future<User?> getUser() {
    return _dao.getUser();
  }

  @override
  Future<User> saveUser(User user) {
    if (user.id == -1) {
      return _dao.addUser(user);
    } else {
      return _dao.updateUser(user);
    }
  }
}
