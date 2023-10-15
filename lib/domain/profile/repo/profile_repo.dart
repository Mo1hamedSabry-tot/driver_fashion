import 'package:dartz/dartz.dart';

import '../../../app/core/network/error/failure.dart';
import '../entites/account_stats_entity.dart';
import '../entites/user_entity.dart';

abstract class ProfileRepo {
  Future<
          Either<Failure,
              ({UserEntity userEntity, AccountStatsEntity accountStatsEntity})>>
      loadProfileData();
}
