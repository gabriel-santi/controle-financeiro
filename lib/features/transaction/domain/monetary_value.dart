import 'package:intl/intl.dart';

class MonetaryValue {
  final double value;

  MonetaryValue(this.value);

  static MonetaryValue get zero => MonetaryValue(0);

  String formattedValue({String symbol = 'R\$', String locale = 'pt_BR'}) {
    final formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(value);
  }

  MonetaryValue operator +(dynamic other) {
    if (other is MonetaryValue) {
      return MonetaryValue(value + other.value);
    } else if (other is num) {
      return MonetaryValue(value + other);
    }
    throw ArgumentError('Invalid type');
  }

  MonetaryValue operator -(dynamic other) {
    if (other is MonetaryValue) {
      return MonetaryValue(value - other.value);
    } else if (other is num) {
      return MonetaryValue(value - other);
    }
    throw ArgumentError('Invalid type');
  }

  MonetaryValue operator *(dynamic other) {
    if (other is MonetaryValue) {
      return MonetaryValue(value * other.value);
    } else if (other is num) {
      return MonetaryValue(value * other);
    }
    throw ArgumentError('Invalid type');
  }

  MonetaryValue operator /(dynamic other) {
    if (other is MonetaryValue) {
      return MonetaryValue(value / other.value);
    } else if (other is num) {
      return MonetaryValue(value / other);
    }
    throw ArgumentError('Invalid type');
  }

  MonetaryValue operator %(dynamic other) {
    if (other is MonetaryValue) {
      return MonetaryValue(value % other.value);
    } else if (other is num) {
      return MonetaryValue(value % other);
    }
    throw ArgumentError('Invalid type');
  }

  bool operator <(dynamic other) {
    if (other is MonetaryValue) {
      return value < other.value;
    } else if (other is num) {
      return value < other;
    }
    throw ArgumentError('Invalid type');
  }

  bool operator <=(dynamic other) {
    if (other is MonetaryValue) {
      return value <= other.value;
    } else if (other is num) {
      return value <= other;
    }
    throw ArgumentError('Invalid type');
  }

  bool operator >(dynamic other) {
    if (other is MonetaryValue) {
      return value > other.value;
    } else if (other is num) {
      return value > other;
    }
    throw ArgumentError('Invalid type');
  }

  bool operator >=(dynamic other) {
    if (other is MonetaryValue) {
      return value >= other.value;
    } else if (other is num) {
      return value >= other;
    }
    throw ArgumentError('Invalid type');
  }
}
