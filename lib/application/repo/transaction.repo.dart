import 'package:finapp/domain/payment.dart';
import 'package:finapp/domain/transaction.dart';

abstract class TransactionRepo {
  Future<List<Transaction>> getTransactionsByMonth(int month);

  Future<Transaction> getPayment(int idPayment);

  Future<void> savePayment(Payment payment);

  Future<void> deletePayment(int idPayment);
}
