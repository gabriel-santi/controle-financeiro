import 'package:finapp/application/repo/category.repo.dart';
import 'package:finapp/application/state/category.state.dart';
import 'package:finapp/domain/category.dart';

class CategoryUseCase {
  final CategoryRepo _repository;
  final CategoryState _state;

  CategoryUseCase(this._repository, this._state);

  Future<void> getCategories() async {
    _state.categories = await _repository.getCategories();
  }

  Future<void> getCategoryById(int id) async {
    _state.selectedCategory = await _repository.getCategory(id);
  }

  Future<void> saveCategory(Category category) async {
    _state.selectedCategory = null;
    return await _repository.saveCategory(category);
  }

  Future<void> deleteCategory(int id) async {
    return await _repository.deleteCategory(id);
  }

  void selectCategory(Category? category) {
    _state.selectedCategory = category;
  }
}
