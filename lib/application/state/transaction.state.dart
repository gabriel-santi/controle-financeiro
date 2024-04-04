import 'package:finapp/domain/transaction.dart';

class TransactionState {
  List<Transaction> transactions = [];
  Transaction? selectedTransaction;
  int selectedMonth = DateTime.now().month;

  static TransactionState? _instance;

  TransactionState._();

  static TransactionState get instance => _instance ??= TransactionState._();
}
