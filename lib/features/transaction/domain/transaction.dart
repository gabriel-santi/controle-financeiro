import 'package:finapp/features/transaction/domain/monetary_value.dart';

abstract class Transaction {
  final int _id;
  final String description;
  final DateTime createdAt;
  final DateTime? lastUpdate;
  final MonetaryValue value;

  @override
  int get id => _id;

  String get createdAtFormatted => "${createdAt.day.toString().padLeft(2, '0')}/${createdAt.month.toString().padLeft(2, '0')}/${createdAt.year}";

  Transaction.load(this._id, this.description, this.createdAt, this.lastUpdate, this.value);

  Transaction.create(this.description, this.value)
      : _id = -1,
        createdAt = DateTime.now(),
        lastUpdate = null {
    _validateDescription(description);
    _validateValue(value);
  }

  static void _validateDescription(String? description) {
    if (description == null || description.trim() == "") throw InvalidDescription();
  }

  static void _validateValue(MonetaryValue? value) {
    if (value == null || value <= 0) throw InvalidValue();
  }
}

class InvalidDescription implements Exception {}

class InvalidValue implements Exception {}
