import 'package:finapp/domain/category.dart';

abstract class CategoryRepo {
  Future<List<Category>> getCategories();

  Future<Category> getCategory(int idCategory);

  Future<void> saveCategory(Category category);

  Future<void> deleteCategory(int idCategory);
}
