import "package:finapp/domain/payment.dart";

class TransactionQueries {
  static String createPaymentTableQuery() => "CREATE TABLE payment ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "description TEXT NOT NULL, "
      "created_at DATETIME NOT NULL, "
      "last_update DATETIME, "
      "value REAL NOT NULL, "
      "account INTEGER, "
      "credit INTEGER)";

  static String getPaymentsByMonthQuery() => "SELECT * FROM payment WHERE strftime('%m', created_at) = ? ORDER BY created_at DESC";

  static String getPaymentQuery(int id) => "SELECT ("
      "id, "
      "description, "
      "created_at, "
      "last_update, "
      "value, "
      "account, "
      "credit) FROM payment WHERE id = $id";

  static String addPaymentQuery(Payment payment) => "INSERT INTO payment (description, created_at, value, account, credit) "
      "VALUES ('${payment.description}', "
      "'${payment.createdAt}', "
      "${payment.value.value}, "
      "${payment.account}, "
      "${payment.credit})";

  static String updatePaymentQuery(Payment payment) => "UPDATE payment SET "
      "description = '${payment.description}', "
      "last_update = '${payment.lastUpdate}', "
      "value = ${payment.value.value}, "
      "account = ${payment.account}, "
      "credit = ${payment.credit} "
      "WHERE id = ${payment.id}";

  static String deletePaymentQuery(int id) => "DELETE FROM payment WHERE id = $id";
}
