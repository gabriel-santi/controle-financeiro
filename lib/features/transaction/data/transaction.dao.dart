import 'package:finapp/database/db_config.sqflite.dart';
import 'package:finapp/features/transaction/data/transaction.queries.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:finapp/features/transaction/domain/transaction.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;

class TransactionDao {
  Database? db;

  TransactionDao();

  Future<List<Transaction>> getPaymentsByDate(int selectedMonth, int selectedYear) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    List<Map<String, dynamic>> rows =
        await db!.rawQuery(TransactionQueries.getPaymentsByMonthQuery, [selectedMonth.toString().padLeft(2, '0'), selectedYear.toString()]);
    List<Payment> transactions = rows.map((mapTransaction) => Payment.fromMap(mapTransaction)).toList();
    return transactions;
  }

  Future<Payment> getPayment(int idPayment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    List<Map<String, dynamic>> rows = await db!.rawQuery(TransactionQueries.getPaymentQuery, [idPayment]);
    Payment payment = Payment.fromMap(rows.first);
    return payment;
  }

  Future<void> addPayment(Payment payment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(TransactionQueries.addPaymentQuery,
        [payment.description, payment.createdAt.toIso8601String(), payment.value.value, payment.category, payment.account, payment.credit ? 1 : 0]);
    return;
  }

  Future<void> updatePayment(Payment payment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(TransactionQueries.updatePaymentQuery, [
      payment.description,
      payment.lastUpdate?.toIso8601String(),
      payment.value.value,
      payment.category,
      payment.account,
      payment.credit ? 1 : 0,
      payment.id
    ]);
    return;
  }

  Future<void> deletePayment(int idPayment) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(TransactionQueries.deletePaymentQuery, [idPayment]);
    return;
  }
}
