import 'package:finapp/application/repo/category.repo.dart';
import 'package:finapp/application/repo/transaction.repo.dart';
import 'package:finapp/infrastructure/entity/db_config.sqflite.dart';
import 'package:finapp/infrastructure/repo/category_sqflite.repo.dart';
import 'package:finapp/infrastructure/repo/transaction_sqflite.repo.dart';

class AppModule {
  static TransactionRepo get transactionRepo => TransactionSqfliteRepo.instance;

  static CategoryRepo get categoryRepo => CategorySqfliteRepo.instance;

  static DatabaseConfig get databaseConfig => DatabaseConfig.instance;
}
