import 'package:finapp/domain/payment.dart';
import 'package:finapp/domain/transaction.dart';
import 'package:finapp/infrastructure/entity/dao/transaction/transaction.queries.dart';
import 'package:finapp/infrastructure/entity/db_config.sqflite.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

class TransactionDao {
  Database? db;

  TransactionDao();

  Future<List<Transaction>> getPaymentsByMonth(int selectedMonth) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    List<Map<String, dynamic>> rows = await db!.rawQuery(TransactionQueries.getPaymentsByMonthQuery(), [selectedMonth.toString().padLeft(2, '0')]);
    List<Payment> transactions = rows.map((mapTransaction) => Payment.fromMap(mapTransaction)).toList();
    return transactions;
  }

  Future<Payment> getPayment(int idPayment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    List<Map<String, dynamic>> rows = await db!.rawQuery(TransactionQueries.getPaymentQuery(idPayment));
    Payment payment = Payment.fromMap(rows.first);
    return payment;
  }

  Future<void> addPayment(Payment payment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(TransactionQueries.addPaymentQuery(payment));
    return;
  }

  Future<void> updatePayment(Payment payment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(TransactionQueries.updatePaymentQuery(payment));
    return;
  }

  Future<void> deletePayment(int idPayment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(TransactionQueries.deletePaymentQuery(idPayment));
    return;
  }
}
