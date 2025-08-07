import 'package:finapp/features/user/data/user_repo.dart';
import 'package:finapp/features/user/domain/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _repository;

  UserBloc(this._repository) : super(UserInitial()) {
    on<LoadUser>(_onLoadUser);
    on<SaveUser>(_onSaveUser);
  }

  Future<void> _onLoadUser(LoadUser event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await _repository.getUser();
      // handle empty user
      emit(UserLoaded(user!));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onSaveUser(SaveUser event, Emitter<UserState> emit) async {
    try {
      await _repository.saveUser(event.user);
      emit(UserLoaded(event.user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
