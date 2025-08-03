part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class LoadCategories extends CategoryEvent {}

class AddCategory extends CategoryEvent {
  final String description;
  final String color;

  AddCategory(this.description, this.color);
}

class RemoveCategory extends CategoryEvent {
  final int categoryId;

  RemoveCategory(this.categoryId);
}
