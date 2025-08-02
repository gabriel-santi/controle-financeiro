import 'package:finapp/features/category/data/category_repository.dart';
import 'package:finapp/features/category/domain/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(CategoryRepo repo)
      : _repo = repo,
        super(CategoryInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<AddCategory>(_addCategory);
    on<RemoveCategory>(_removeCategory);
  }

  final CategoryRepo _repo;

  void _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) async {
    try {
      final categories = await _repo.getCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void _addCategory(AddCategory event, Emitter<CategoryState> emit) async {
    if (state is! CategoriesLoaded) {
      add(LoadCategories());
      return;
    }

    final current = (state as CategoriesLoaded).categories;
    final optimisticList = List<Category>.from(current)..add(event.category);
    emit(CategoriesLoaded(optimisticList));

    try {
      await _repo.saveCategory(event.category);
    } catch (e) {
      // rollback
      final reverted = optimisticList.where((c) => c.id != event.category.id).toList();
      emit(CategoryError(e.toString()));
      emit(CategoriesLoaded(reverted));
    }
  }

  void _removeCategory(RemoveCategory event, Emitter<CategoryState> emit) async {
    if (state is! CategoriesLoaded) {
      add(LoadCategories());
      return;
    }

    final current = (state as CategoriesLoaded).categories;
    final optimisticList = current.where((c) => c.id != event.categoryId).toList();
    emit(CategoriesLoaded(optimisticList));

    try {
      await _repo.deleteCategory(event.categoryId);
    } catch (e) {
      // rollback
      emit(CategoryError(e.toString()));
      emit(CategoriesLoaded(current));
    }
  }
}
