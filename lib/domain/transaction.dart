import 'package:finapp/domain/entity.dart';

class Transaction extends Entity {
  final int _id;
  final String description;
  final DateTime creation;
  final DateTime? lastUpdate;
  final double value;

  Transaction._(this._id, this.description, this.creation, this.lastUpdate, this.value);

  @override
  int get id => _id;

  factory Transaction.load(int id, String description, DateTime creation, DateTime? lastUpdate, double value) {
    return Transaction._(id, description, creation, lastUpdate, value);
  }

  factory Transaction.create(String? description, double? value) {
    _validateDescription(description);
    _validateValue(value);
    return Transaction._(-1, description!, DateTime.now(), null, value!);
  }

  static void _validateDescription(String? description) {
    if (description == null || description.trim() == "") throw InvalidDescription();
  }

  static void _validateValue(double? value) {
    if (value == null || value <= 0) throw InvalidValue();
  }

  Transaction copyWith([String? description, DateTime? creation, DateTime? lastUpdate, double? value]) {
    return Transaction.load(
      _id,
      description ?? this.description,
      creation ?? this.creation,
      lastUpdate ?? this.lastUpdate,
      value ?? this.value,
    );
  }
}

class InvalidDescription implements Exception {}

class InvalidValue implements Exception {}
