import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/core/usecase/usecase.dart';
import '../../../domain/auth/usecases/logout_usecase.dart';
import '../../../domain/profile/entites/account_stats_entity.dart';
import '../../../domain/profile/entites/user_entity.dart';
import '../../../domain/profile/usecases/load_profile_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //? profile data
  UserEntity? profileEntity;
  AccountStatsEntity? accountStatsEntity;
  Future<void> _handleLoadProfile(Emitter<ProfileState> emit) async {
    emit(ProfileDataLoadingState());

    final res = await _loadProfileDataUsecase(NoParams());

    res.fold(
      (failure) {
        emit(ProfileDataFailureState());
      },
      (profileRecord) {
        profileEntity = profileRecord.userEntity;
        accountStatsEntity = profileRecord.accountStatsEntity;
        emit(ProfileDataSuccessState());
      },
    );
  }

  //? logout
  Future<void> _handleLogout(Emitter<ProfileState> emit) async {
    emit(LogoutLoadingState());

    final res = await _logoutUsecase(NoParams());

    res ? emit(LogoutSuccessState()) : emit(LogoutFailureState());
  }

  final LoadProfileDataUsecase _loadProfileDataUsecase;
  final LogoutUsecase _logoutUsecase;
  ProfileBloc({
    required LoadProfileDataUsecase loadProfileDataUsecase,
    required LogoutUsecase logoutUsecase,
  })  : _loadProfileDataUsecase = loadProfileDataUsecase,
        _logoutUsecase = logoutUsecase,
        super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      return switch (event) {
        LoadProfileDataEvent() => await _handleLoadProfile(emit),
        LogoutEvent() => await _handleLogout(emit),
      };
    });
  }
}
