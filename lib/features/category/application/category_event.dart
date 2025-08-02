part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class LoadCategories extends CategoryEvent {}

class AddCategory extends CategoryEvent {
  final Category category;

  AddCategory(this.category);
}

class RemoveCategory extends CategoryEvent {
  final int categoryId;

  RemoveCategory(this.categoryId);
}
