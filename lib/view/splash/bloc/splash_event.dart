part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

final class NavigateToNextScreenEvent extends SplashEvent {
  final BuildContext context;

  const NavigateToNextScreenEvent({required this.context});
}
