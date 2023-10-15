part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class StartLoginEvent extends LoginEvent {
  final String email;
  final String password;

  StartLoginEvent({required this.email, required this.password});
}

class ToggleVisibilityEvent extends LoginEvent {}

class ToggleKeepMeLoggedEvent extends LoginEvent {}
