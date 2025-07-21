import 'package:finapp/features/transaction/data/transaction.dao.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:finapp/features/transaction/domain/transaction.dart';

abstract class TransactionRepo {
  Future<List<Transaction>> getTransactionsByDate(int month, int year);

  Future<Payment> getPayment(int idPayment);

  Future<void> savePayment(Payment payment);

  Future<void> deletePayment(int idPayment);
}

class TransactionSqfliteRepo implements TransactionRepo {
  final TransactionDao _dao = TransactionDao();

  static TransactionSqfliteRepo? _instance;

  TransactionSqfliteRepo._();

  static TransactionSqfliteRepo get instance {
    _instance ??= TransactionSqfliteRepo._();

    return _instance!;
  }

  @override
  Future<void> deletePayment(int id) async {
    return _dao.deletePayment(id);
  }

  @override
  Future<Payment> getPayment(int id) async {
    return _dao.getPayment(id);
  }

  @override
  Future<List<Transaction>> getTransactionsByDate(int month, int year) async {
    return _dao.getPaymentsByDate(month, year);
  }

  @override
  Future<void> savePayment(Payment transaction) async {
    return transaction.id == -1 ? _dao.addPayment(transaction) : _dao.updatePayment(transaction);
  }
}
