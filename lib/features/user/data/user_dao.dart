import 'package:finapp/database/db_config.sqflite.dart';
import 'package:finapp/features/user/data/user_queries.dart';
import 'package:finapp/features/user/domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  Database? db;

  UserDao();

  Future<User?> getUser() async {
    db ??= await DatabaseConfig.instance.getDatabase();
    final rows = await db!.rawQuery(UserQueries.getUserQuery);
    if (rows.isEmpty) return null;
    return User.fromMap(rows.first);
  }

  Future<User> addUser(User user) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    final id = await db!.rawInsert(UserQueries.createUserQuery, [user.name]);
    return user.copyWith(id: id);
  }

  Future<User> updateUser(User user) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(UserQueries.updateUserQuery, [user.name, user.id]);
    return user;
  }
}
