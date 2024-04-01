import 'package:finapp/application/repo/transaction.repo.dart';
import 'package:finapp/domain/payment.dart';
import 'package:finapp/domain/transaction.dart';
import 'package:finapp/infrastructure/entity/dao/transaction/transaction.dao.dart';

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
  Future<List<Transaction>> getTransactions() async {
    return _dao.getAllPayments();
  }

  @override
  Future<void> savePayment(Payment transaction) async {
    return transaction.id == -1 ? _dao.addPayment(transaction) : _dao.updatePayment(transaction);
  }
}
