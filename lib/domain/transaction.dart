class Transaction {
  final int? id;
  final String description;
  final DateTime date;
  final double value;

  Transaction._(this.id, this.description, this.date, this.value);

  factory Transaction.load(int id, String description, DateTime date, double value) {
    return Transaction._(id, description, date, value);
  }

  factory Transaction.create(String? description, double? value) {
    _validateDescription(description);
    _validateValue(value);
    return Transaction._(null, description!, DateTime.now(), value!);
  }

  static void _validateDescription(String? description) {
    if (description == null || description.trim() == "") throw InvalidDescription();
  }

  static void _validateValue(double? value) {
    if (value == null || value <= 0) throw InvalidValue();
  }
}

class InvalidDescription implements Exception {}

class InvalidValue implements Exception {}
