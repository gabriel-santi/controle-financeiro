import 'package:finapp/features/transaction/data/transaction_repository.dart';
import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/domain/payment.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_transaction_event.dart';
part 'add_transaction_state.dart';

class AddTransactionBloc extends Bloc<AddTransactionEvent, AddTransactionState> {
  final TransactionRepo repository;

  AddTransactionBloc(this.repository) : super(AddTransactionInitial()) {
    on<CreationRequested>((_createTransaction));
  }

  void _createTransaction(CreationRequested event, Emitter<AddTransactionState> emit) async {
    emit(AddTransactionLoading());
    try {
      Payment payment = Payment.create(event.description, event.value, event.categoryId, null, false);
      await repository.savePayment(payment);
      emit(AddTransactionSuccess());
    } catch (e) {
      emit(AddTransactionFailure(e.toString()));
    }
  }
}
