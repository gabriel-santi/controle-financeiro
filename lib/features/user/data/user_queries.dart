class UserQueries {
  static const createUserTableQuery = """
  CREATE TABLE IF NOT EXISTS user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome TEXT NOT NULL
  );
  """;

  static const getUserQuery = 'SELECT * FROM user LIMIT 1;';

  static const createUserQuery = 'INSERT INTO user (name) VALUES (?);';

  static const updateUserQuery = 'UPDATE user SET name = ? WHERE id = ?;';
}
