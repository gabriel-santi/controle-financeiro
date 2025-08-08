import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedCategoryCubit extends Cubit<int?> {
  SelectedCategoryCubit() : super(null);

  void select(int categoryId) {
    if (categoryId == state) {
      emit(null);
    } else {
      emit(categoryId);
    }
  }
}
