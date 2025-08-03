import 'package:finapp/database/db_config.sqflite.dart';
import 'package:finapp/features/category/data/category.queries.dart';
import 'package:finapp/features/category/domain/category.dart';
import 'package:sqflite/sqflite.dart';

class CategoryDao {
  Database? db;

  CategoryDao();

  Future<List<Category>> getCategories() async {
    db ??= await DatabaseConfig.instance.getDatabase();
    List<Map<String, dynamic>> rows = await db!.rawQuery(CategoryQueries.getCategoriesQuery);
    List<Category> categories = rows.map((mapCategory) => Category.fromMap(mapCategory)).toList();
    return categories;
  }

  Future<Category> getCategory(int idCategory) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    List<Map<String, dynamic>> rows = await db!.rawQuery(CategoryQueries.getCategoryQuery, [idCategory]);
    Category category = Category.fromMap(rows.first);
    return category;
  }

  Future<Category> addCategory(Category category) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    final id = await db!.rawInsert(CategoryQueries.createCategoryQuery, [category.description, category.color.value.toString()]);
    return category.copyWith(id: id);
  }

  Future<Category> updateCategory(Category category) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(CategoryQueries.updateCategoryQuery, [category.description, category.color.value.toString(), category.id]);
    return category;
  }

  Future<void> deleteCategory(int idCategory) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(CategoryQueries.deleteCategoryQuery, [idCategory]);
    return;
  }
}
