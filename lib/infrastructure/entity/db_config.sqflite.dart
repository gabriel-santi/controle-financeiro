import 'package:finapp/infrastructure/entity/dao/category/category.queries.dart';
import 'package:finapp/infrastructure/entity/dao/transaction/transaction.queries.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static DatabaseConfig? _instance;

  DatabaseConfig._();

  static DatabaseConfig get instance {
    _instance ??= DatabaseConfig._();
    return _instance!;
  }

  Future<Database> getDatabase() async {
    final String path = join(await getDatabasesPath(), 'finapp.db');

    return openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(TransactionQueries.createPaymentTableQuery);
        await db.execute(CategoryQueries.createCategoryTableQuery);
      },
      version: 1,
    );
  }
}
