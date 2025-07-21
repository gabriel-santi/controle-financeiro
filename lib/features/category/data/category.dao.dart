import 'package:finapp/features/category/data/category.queries.dart';
import 'package:finapp/features/category/domain/category.dart';
import 'package:finapp/infrastructure/entity/db_config.sqflite.dart';
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

  Future<void> addCategory(Category category) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(CategoryQueries.createCategoryQuery, [category.description, category.color.value.toString()]);
    return;
  }

  Future<void> updateCategory(Category category) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(CategoryQueries.updateCategoryQuery, [category.description, category.color.value.toString(), category.id]);
    return;
  }

  Future<void> deleteCategory(int idCategory) async {
    db ??= await DatabaseConfig.instance.getDatabase();
    await db!.rawQuery(CategoryQueries.deleteCategoryQuery, [idCategory]);
    return;
  }
}
