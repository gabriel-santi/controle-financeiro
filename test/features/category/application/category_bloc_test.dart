import 'package:bloc_test/bloc_test.dart';
import 'package:finapp/features/category/application/category_bloc.dart';
import 'package:finapp/features/category/data/category_repository.dart';
import 'package:finapp/features/category/domain/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock.dart';

void main() {
  late CategoryRepo categoryRepo;
  late CategoryBloc bloc;

  setUp(() {
    categoryRepo = MockCategoryRepo();
    bloc = CategoryBloc(categoryRepo);
  });

  const description = "Food";
  const color = "0xFFFFF";
  final categoryCreated = Category.load(-1, description, color);
  final categorySaved = Category.load(123, description, color);
  setUpAll(() {
    registerFallbackValue(Category.create(description, color));
  });

  group("Category Bloc Test", () {
    //  initial state
    test("Initial state", () {
      expect(bloc.state, CategoryInitial());
    });

    // on load categories(happy and error)
    blocTest("onLoad success",
        build: () {
          when(categoryRepo.getCategories).thenAnswer((_) => Future.value([]));
          return bloc;
        },
        act: (bloc) => bloc.add(LoadCategories()),
        expect: () => [CategoriesLoaded(const [])],
        verify: (_) {
          verify(categoryRepo.getCategories).called(1);
        });

    blocTest("onLoad failure",
        build: () {
          final exception = Exception('Impossible to fetch categories');
          when(categoryRepo.getCategories).thenThrow(exception);
          return bloc;
        },
        act: (bloc) => bloc.add(LoadCategories()),
        expect: () => [isA<CategoryError>()],
        verify: (_) {
          verify(categoryRepo.getCategories).called(1);
        });

    blocTest<CategoryBloc, CategoryState>("When add with InitialState, try to fetch the categories and then add ",
        build: () {
          when(() => categoryRepo.saveCategory(any())).thenAnswer((_) => Future.value(categorySaved));
          when(categoryRepo.getCategories).thenAnswer((_) => Future.value([]));
          return bloc;
        },
        act: (bloc) => bloc.add(AddCategory(description, color)),
        expect: () => [
              CategoriesLoaded(const []), // after fetch
              CategoriesLoaded([categoryCreated]), // optimistic state
              CategoriesLoaded([categorySaved]), // after remote save
            ],
        verify: (_) {
          verify(() => categoryRepo.getCategories()).called(1);
          verify(() => categoryRepo.saveCategory(any())).called(1);
        });

    blocTest<CategoryBloc, CategoryState>("When add with Categories loaded, adds successfuly without fetching",
        build: () {
          when(() => categoryRepo.saveCategory(any())).thenAnswer((_) => Future.value(categorySaved));
          return bloc;
        },
        act: (bloc) {
          bloc.add(AddCategory(description, color));
        },
        seed: () => CategoriesLoaded(const []),
        // Initial State
        expect: () => [
              CategoriesLoaded([categoryCreated]),
              CategoriesLoaded([categorySaved]),
            ],
        verify: (_) {
          verifyNever(() => categoryRepo.getCategories());
          verify(() => categoryRepo.saveCategory(any())).called(1);
        });

    blocTest<CategoryBloc, CategoryState>("When add failure then perform rollback",
        build: () {
          final exception = Exception("Impossible to save");
          when(() => categoryRepo.saveCategory(any())).thenThrow(exception);
          when(categoryRepo.getCategories).thenAnswer((_) => Future.value([]));
          return bloc;
        },
        act: (bloc) {
          bloc.add(AddCategory(description, color));
        },
        seed: () => CategoriesLoaded(const []),
        expect: () => [
              CategoriesLoaded([categoryCreated]), // optimistic state
              isA<CategoryError>(),
              CategoriesLoaded(const []), // rollback
            ],
        verify: (_) {
          verifyNever(() => categoryRepo.getCategories());
          verify(() => categoryRepo.saveCategory(any())).called(1);
        });

    blocTest<CategoryBloc, CategoryState>(
      "When remove with InitialState, fetch categories then remove successfully",
      build: () {
        when(() => categoryRepo.deleteCategory(any())).thenAnswer((_) async => {});
        when(() => categoryRepo.getCategories()).thenAnswer((_) async => [categorySaved]);
        return bloc;
      },
      act: (bloc) => bloc.add(RemoveCategory(categorySaved.id)),
      expect: () => [
        CategoriesLoaded([categorySaved]), // after fetch
        CategoriesLoaded(const []),
      ],
      verify: (_) {
        verify(() => categoryRepo.getCategories()).called(1);
        verify(() => categoryRepo.deleteCategory(categorySaved.id)).called(1);
      },
    );
  });

  blocTest<CategoryBloc, CategoryState>(
    "When remove with CategoriesLoaded, removes successfully without fetching",
    build: () {
      when(() => categoryRepo.deleteCategory(any())).thenAnswer((_) async => {});
      return bloc;
    },
    seed: () => CategoriesLoaded([categorySaved]),
    act: (bloc) => bloc.add(RemoveCategory(categorySaved.id)),
    expect: () => [
      CategoriesLoaded(const []),
    ],
    verify: (_) {
      verify(() => categoryRepo.deleteCategory(categorySaved.id)).called(1);
      verifyNever(() => categoryRepo.getCategories());
    },
  );

  blocTest<CategoryBloc, CategoryState>(
    "When remove fails, shows error and performs rollback",
    build: () {
      when(() => categoryRepo.deleteCategory(any())).thenThrow(Exception("Failed to remove"));
      return bloc;
    },
    seed: () => CategoriesLoaded([categorySaved]),
    act: (bloc) => bloc.add(RemoveCategory(categorySaved.id)),
    expect: () => [
      CategoriesLoaded(const []), // optimistic state
      isA<CategoryError>(),
      CategoriesLoaded([categorySaved]), // rollback
    ],
    verify: (_) {
      verify(() => categoryRepo.deleteCategory(categorySaved.id)).called(1);
      verifyNever(() => categoryRepo.getCategories());
    },
  );
}
