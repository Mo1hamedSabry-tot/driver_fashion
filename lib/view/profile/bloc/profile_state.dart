part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

//? Load Profile Data
final class ProfileDataLoadingState extends ProfileState {}

final class ProfileDataSuccessState extends ProfileState {}

final class ProfileDataFailureState extends ProfileState {}

//? logout
final class LogoutLoadingState extends ProfileState {}

final class LogoutSuccessState extends ProfileState {}

final class LogoutFailureState extends ProfileState {}
