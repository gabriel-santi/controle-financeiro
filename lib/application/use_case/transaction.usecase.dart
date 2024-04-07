import 'package:finapp/application/repo/transaction.repo.dart';
import 'package:finapp/application/state/transaction.state.dart';
import 'package:finapp/domain/payment.dart';
import 'package:finapp/domain/transaction.dart';

class TransactionUseCase {
  final TransactionRepo _repo;
  final TransactionState _state;

  TransactionUseCase(this._repo, this._state);

  Future<void> getPaymentById(int id) async {
    _state.selectedTransaction = await _repo.getPayment(id);
  }

  Future<void> getTransactions() async {
    _state.transactions = await _repo.getTransactionsByDate(_state.selectedMonth, _state.selectedYear);
  }

  Future<void> savePayment(Payment transaction) async {
    await _repo.savePayment(transaction);
  }

  Future<void> deletePayment(int id) async {
    await _repo.deletePayment(id);
  }

  void selectTransaction(Transaction? transaction) {
    _state.selectedTransaction = transaction;
  }

  void selectMonth(int month) {
    _state.selectedMonth = month;
  }
}
