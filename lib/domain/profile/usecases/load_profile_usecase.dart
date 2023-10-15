import 'package:dartz/dartz.dart';

import '../../../app/core/network/error/failure.dart';
import '../../../app/core/usecase/usecase.dart';
import '../entites/account_stats_entity.dart';
import '../entites/user_entity.dart';
import '../repo/profile_repo.dart';

class LoadProfileDataUsecase
    implements
        BaseUsecase<
            Future<
                Either<
                    Failure,
                    ({
                      UserEntity userEntity,
                      AccountStatsEntity accountStatsEntity
                    })>>,
            NoParams> {
  final ProfileRepo _profileRepo;

  LoadProfileDataUsecase({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo;

  @override
  Future<
          Either<Failure,
              ({AccountStatsEntity accountStatsEntity, UserEntity userEntity})>>
      call(NoParams params) async {
    return await _profileRepo.loadProfileData();
  }
}
