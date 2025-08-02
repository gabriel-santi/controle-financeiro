part of 'add_transaction_bloc.dart';

@immutable
sealed class AddTransactionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddTransactionInitial extends AddTransactionState {}

class AddTransactionLoading extends AddTransactionState {}

class AddTransactionSuccess extends AddTransactionState {}

class AddTransactionFailure extends AddTransactionState {
  final String errorMessage;

  AddTransactionFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
