import 'package:dartz/dartz.dart';
import 'package:test_project/data/profile/mappers/dummy/account_stats_mapper.dart';
import 'package:test_project/data/profile/mappers/user_data_mapper.dart';

import '../../../app/core/network/error/failure.dart';
import '../../../domain/profile/entites/account_stats_entity.dart';
import '../../../domain/profile/entites/user_entity.dart';
import '../../../domain/profile/repo/profile_repo.dart';
import '../data_sources/remote_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepoImpl({required ProfileRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<
          Either<Failure,
              ({AccountStatsEntity accountStatsEntity, UserEntity userEntity})>>
      loadProfileData() async {
    final res = await _remoteDataSource.getProfileData();

    return res.fold(
      (failure) => Left(failure),
      (profileRecord) => Right((
        accountStatsEntity: profileRecord.accountStatsModel.toDomain(),
        userEntity: profileRecord.userModel.toDomain(),
      )),
    );
  }
}
