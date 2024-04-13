class TransactionQueries {
  static String get createPaymentTableQuery => "CREATE TABLE payment ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "description TEXT NOT NULL, "
      "created_at DATETIME NOT NULL, "
      "last_update DATETIME, "
      "value REAL NOT NULL, "
      "category INTEGER, "
      "account INTEGER, "
      "credit INTEGER)";

  static String get getPaymentsByMonthQuery =>
      "SELECT * FROM payment WHERE strftime('%m', created_at) = ? AND strftime('%Y', created_at) = ? ORDER BY created_at DESC";

  static String get getPaymentQuery => "SELECT "
      "id, "
      "description, "
      "created_at, "
      "last_update, "
      "value, "
      "category, "
      "account, "
      "credit FROM payment WHERE id = ?";

  static String get addPaymentQuery => "INSERT INTO payment (description, created_at, value, account, credit) "
      "VALUES (?, ?, ?, ?, ?)";

  static String get updatePaymentQuery => "UPDATE payment SET "
      "description = ?, "
      "last_update = ?, "
      "value = ?, "
      "category = ?, "
      "account = ?, "
      "credit = ? "
      "WHERE id = ?";

  static String get deletePaymentQuery => "DELETE FROM payment WHERE id = ?";
}
