import 'package:finapp/features/transaction/application/selected_category_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SelectedCategoryCubit', () {
    late SelectedCategoryCubit cubit;

    setUp(() {
      cubit = SelectedCategoryCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state should be null', () {
      expect(cubit.state, isNull);
    });

    test('should emit categoryId when selecting a category', () {
      cubit.select(1);
      expect(cubit.state, equals(1));
    });

    test('should deselect when selecting the same category twice', () {
      cubit.select(1);
      cubit.select(1);
      expect(cubit.state, isNull);
    });

    test('should replace previously selected category when selecting a different one', () {
      cubit.select(1);
      cubit.select(2);
      expect(cubit.state, equals(2));
    });
  });
}
