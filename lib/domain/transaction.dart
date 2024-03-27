import 'package:finapp/domain/entity.dart';

class Transaction extends Entity {
  final int _id;
  final String description;
  final DateTime createdAt;
  final DateTime? lastUpdate;
  final double value;
  final int? source;
  final bool credit;

  Transaction._(this._id, this.description, this.createdAt, this.lastUpdate, this.value, this.source, this.credit);

  @override
  int get id => _id;

  factory Transaction.load(int id, String description, DateTime creation, DateTime? lastUpdate, double value, int? source, bool credit) {
    return Transaction._(id, description, creation, lastUpdate, value, source, credit);
  }

  factory Transaction.create(String? description, double? value, int? source, bool credit) {
    _validateDescription(description);
    _validateValue(value);
    return Transaction._(-1, description!, DateTime.now(), null, value!, source, credit);
  }

  static void _validateDescription(String? description) {
    if (description == null || description.trim() == "") throw InvalidDescription();
  }

  static void _validateValue(double? value) {
    if (value == null || value <= 0) throw InvalidValue();
  }

  Transaction copyWith([String? description, DateTime? createdAt, DateTime? lastUpdate, double? value, int? source, bool? credit]) {
    return Transaction.load(
      _id,
      description ?? this.description,
      createdAt ?? this.createdAt,
      lastUpdate ?? this.lastUpdate,
      value ?? this.value,
      source ?? this.source,
      credit ?? this.credit,
    );
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction.load(
      map["id"],
      map["description"],
      map["creation"],
      map["last_update"],
      map["value"],
      map["source"],
      map["credit"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": _id,
      "description": description,
      "creation": createdAt.toString(),
      "last_update": lastUpdate.toString(),
      "value": value,
      "source": source,
      "credit": credit,
    };
  }
}

class InvalidDescription implements Exception {}

class InvalidValue implements Exception {}
