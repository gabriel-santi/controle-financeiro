part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class LoadUser extends UserEvent {}

class SaveUser extends UserEvent {
  final User user;

  SaveUser(this.user);
}
