import 'package:test_project/data/profile/models/dummy_models/user_data.dart';

import '../../../../app/core/utils/value_managers/assets_manager.dart';
import '../../../../domain/profile/entites/user_entity.dart';

extension ToDomain on UserModel {
  UserEntity toDomain() {
    return UserEntity(
      id: id,
      name: name,
      rating: rating?.toStringAsFixed(1) ?? '0',
      imgUrl: imgUrl ?? ImgManager.defaultProfileImg,
      phoneNumber: phoneNumber ?? "",
    );
  }
}
