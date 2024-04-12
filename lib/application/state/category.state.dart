import 'package:finapp/domain/category.dart';

class CategoryState {
  List<Category> categories = [];
  Category? selectedCategory;

  static CategoryState? _instance;

  CategoryState._();

  static CategoryState get instance => _instance ??= CategoryState._();
}
