import 'package:finapp/application/component/component.dart';
import 'package:finapp/application/repo/category.repo.dart';
import 'package:finapp/application/repo/transaction.repo.dart';
import 'package:finapp/application/state/category.state.dart';
import 'package:finapp/application/state/transaction.state.dart';
import 'package:finapp/application/use_case/category.usecase.dart';
import 'package:finapp/application/use_case/transaction.usecase.dart';
import 'package:finapp/domain/payment.dart';

class TransactionComponent extends Component {
  late TransactionUseCase _useCase;
  late CategoryUseCase _categoryUseCase;

  void initialize(TransactionRepo transactionRepo, TransactionState transactionState, CategoryRepo categoryRepo,
      CategoryState categoryState, Function() updateScreen) {
    _useCase = TransactionUseCase(transactionRepo, transactionState);
    _categoryUseCase = CategoryUseCase(categoryRepo, categoryState);
    super.updateScreen = updateScreen;
  }

  Future<void> getTransactions() async {
    return execute(() async {
      await _useCase.getTransactions();
      await _categoryUseCase.getCategories();
    });
  }

  void selectTransaction(Payment? payment) {
    _useCase.selectPayment(payment);
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
