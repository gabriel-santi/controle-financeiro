class CategoryQueries {
  static String get createCategoryTableQuery =>
      "CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL, color TEXT NOT NULL)";

  static String get getCategoriesQuery => "SELECT id, description, color FROM category";

  static String get getCategoryQuery => "SELECT id, description, color FROM category WHERE id = ?";

  static String get deleteCategoryQuery => "DELETE FROM category WHERE id = ?";

  static String get createCategoryQuery => "INSERT INTO category (description, color) VALUES (? , ?)";

  static String get updateCategoryQuery => "UPDATE category SET description = ?, color = ? WHERE id = ?";
}
