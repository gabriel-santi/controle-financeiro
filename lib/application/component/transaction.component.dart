import 'package:finapp/application/component/component.dart';
import 'package:finapp/application/repo/transaction.repo.dart';
import 'package:finapp/application/state/transaction.state.dart';
import 'package:finapp/application/use_case/transaction.usecase.dart';
import 'package:finapp/domain/payment.dart';
import 'package:finapp/domain/transaction.dart';

class TransactionComponent extends Component {
  late TransactionUseCase _useCase;

  void initialize(TransactionRepo repo, TransactionState state, Function() updateScreen) {
    _useCase = TransactionUseCase(repo, state);
    super.updateScreen = updateScreen;
  }

  Future<void> getTransactions() async {
    return execute(() => _useCase.getTransactions());
  }

  void selectTransaction(Transaction? transaction) {
    _useCase.selectTransaction(transaction);
  }

  void selectMonth(int month) {
    _useCase.selectMonth(month);
  }

  Future<void> getPaymentById(int id) async {
    return execute(() => _useCase.getPaymentById(id));
  }

  Future<void> savePayment(Payment payment) async {
    return execute(() => _useCase.savePayment(payment));
  }

  Future<void> deletePayment(int id) async {
    return execute(() => _useCase.deletePayment(id));
  }
}
