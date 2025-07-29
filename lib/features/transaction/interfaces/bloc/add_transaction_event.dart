part of 'add_transaction_bloc.dart';

@immutable
sealed class AddTransactionEvent {}

class CreationRequested extends AddTransactionEvent {
  final String description;
  final MonetaryValue value;
  final int? categoryId;

  CreationRequested({required this.description, required this.value, required this.categoryId});
}
