import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/config/routes.dart';
import '../../../app/core/usecase/usecase.dart';
import '../../../domain/auth/usecases/is_logged_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final IsLoggedUsecase _isLoggedUsecase;
  SplashBloc({required IsLoggedUsecase isLoggedUsecase})
      : _isLoggedUsecase = isLoggedUsecase,
        super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      switch (event) {
        case NavigateToNextScreenEvent():
          _handleNextScreen(event);
      }
    });
  }

  void _handleNextScreen(NavigateToNextScreenEvent event) {
    final res = _isLoggedUsecase(NoParams());
    Timer(const Duration(milliseconds: 0), () {
      Navigator.pushReplacementNamed(
          event.context, res ? Routes.homeRoute : Routes.loginRoute);
    });
  }
}
