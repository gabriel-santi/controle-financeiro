import 'package:finapp/features/transaction/domain/monetary_value.dart';
import 'package:finapp/features/transaction/domain/transaction.dart';

class Payment extends Transaction {
  final int? category;
  final int? account;
  final bool credit;

  Payment.create(super.description, super.value, this.category, this.account, this.credit) : super.create();

  Payment.load(super.id, super.description, super.createdAt, super.lastUpdate, super.value, this.category, this.account, this.credit) : super.load();

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment.load(
      map['id'],
      map['description'],
      DateTime.parse(map['created_at']),
      map['last_update'] != null ? DateTime.parse(map['last_update']) : null,
      MonetaryValue(map['value']),
      map['category'],
      map['account'],
      map['credit'] == 1,
    );
  }

  Payment copyWith({
    int? id,
    String? description,
    DateTime? createdAt,
    DateTime? lastUpdate,
    MonetaryValue? value,
    int? category,
    int? account,
    bool? credit,
  }) {
    return Payment.load(
      id ?? super.id,
      description ?? super.description,
      createdAt ?? super.createdAt,
      lastUpdate ?? super.lastUpdate,
      value ?? super.value,
      category ?? this.category,
      account ?? this.account,
      credit ?? this.credit,
    );
  }
}
