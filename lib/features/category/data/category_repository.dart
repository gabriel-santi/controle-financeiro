import 'package:finapp/features/category/data/category.dao.dart';
import 'package:finapp/features/category/domain/category.dart';

abstract class CategoryRepo {
  Future<List<Category>> getCategories();

  Future<Category> getCategory(int idCategory);

  Future<Category> saveCategory(Category category);

  Future<void> deleteCategory(int idCategory);
}

class CategorySqfliteRepo extends CategoryRepo {
  final CategoryDao _dao = CategoryDao();

  static CategorySqfliteRepo? _instance;

  CategorySqfliteRepo._();

  static CategorySqfliteRepo get instance {
    _instance ??= CategorySqfliteRepo._();

    return _instance!;
  }

  @override
  Future<List<Category>> getCategories() {
    return _dao.getCategories();
  }

  @override
  Future<Category> getCategory(int idCategory) {
    return _dao.getCategory(idCategory);
  }

  @override
  Future<Category> saveCategory(Category category) {
    if (category.id == -1) {
      return _dao.addCategory(category);
    } else {
      return _dao.updateCategory(category);
    }
  }

  @override
  Future<void> deleteCategory(int idCategory) {
    return _dao.deleteCategory(idCategory);
  }
}
