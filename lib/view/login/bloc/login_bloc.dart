import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/domain/auth/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase _loginUsecase;

  void _handleStartLogin(
      {required StartLoginEvent event,
      required Emitter<LoginState> emit}) async {
    emit(LoginLoading());

    final rslt = await _loginUsecase(
        LoginParams(email: event.email, password: event.password));

    emit(rslt ? LoginSuccess() : LoginFailure());
  }

  bool obsecure = true;
  void _handleToggle({required Emitter<LoginState> emit}) {
    obsecure = !obsecure;
    emit(VisibilityToggled());
  }

  bool keepMeLogged = false;
  void _handleKeepMeLoggedToggled({required Emitter<LoginState> emit}) {
    keepMeLogged = !keepMeLogged;

    emit(KeepMeLoggedToggled());
  }

  LoginBloc({required LoginUsecase loginUsecase})
      : _loginUsecase = loginUsecase,
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      return switch (event) {
        StartLoginEvent() => _handleStartLogin(emit: emit, event: event),
        ToggleVisibilityEvent() => _handleToggle(emit: emit),
        ToggleKeepMeLoggedEvent() => _handleKeepMeLoggedToggled(emit: emit),
      };
    });
  }
}
