import 'package:intl/intl.dart';

class MonetaryValue {
  final double amount;

  MonetaryValue(this.amount);

  String formattedValue({String symbol = 'R\$', String locale = 'pt_BR'}) {
    final formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(amount);
  }

  MonetaryValue operator +(num other) => MonetaryValue(amount + other);

  MonetaryValue operator -(num other) => MonetaryValue(amount - other);

  MonetaryValue operator *(num other) => MonetaryValue(amount * other);

  MonetaryValue operator /(num other) => MonetaryValue(amount / other);

  bool operator <(num other) => amount < other;

  bool operator <=(num other) => amount <= other;

  bool operator >(num other) => amount > other;

  bool operator >=(num other) => amount >= other;
}
