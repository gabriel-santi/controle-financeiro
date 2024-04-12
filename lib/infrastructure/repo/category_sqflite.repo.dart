import 'package:finapp/application/repo/category.repo.dart';
import 'package:finapp/domain/category.dart';
import 'package:finapp/infrastructure/entity/dao/category/category.dao.dart';

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
  Future<void> saveCategory(Category category) {
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
