part of 'add_transaction_bloc.dart';

@immutable
sealed class AddTransactionState {}

class AddTransactionInitial extends AddTransactionState {}

class AddTransactionLoading extends AddTransactionState {}

class AddTransactionSuccess extends AddTransactionState {}

class AddTransactionFailure extends AddTransactionState {
  final String errorMessage;

  AddTransactionFailure(this.errorMessage);
}
