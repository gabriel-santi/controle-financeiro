import 'package:finapp/domain/transaction.dart';

class TransactionState {
  List<Transaction> transactions = [];
  Transaction? transactionSelected;

  static TransactionState? _instance;

  TransactionState._();

  static TransactionState get instance => _instance ??= TransactionState._();
}
