import 'package:finapp/application/component/component.dart';
import 'package:finapp/application/repo/category.repo.dart';
import 'package:finapp/application/state/category.state.dart';
import 'package:finapp/application/use_case/category.usecase.dart';
import 'package:finapp/domain/category.dart';

class CategoryComponent extends Component {
  late CategoryUseCase useCase;

  void initialize(CategoryRepo repo, CategoryState state, Function() updateScreen) {
    useCase = CategoryUseCase(repo, state);
  }

  Future<void> getCategories() async {
    return execute(() => useCase.getCategories());
  }

  Future<void> getCategory(int idCategory) async {
    return execute(() => useCase.getCategoryById(idCategory));
  }

  Future<void> saveCategory(Category category) async {
    return execute(() => useCase.saveCategory(category));
  }

  Future<void> deleteCategory(int idCategory) async {
    return execute(() => useCase.deleteCategory(idCategory));
  }

  void selectCategory(Category? category) {
    useCase.selectCategory(category);
  }
}
