import '../../../app/core/utils/value_managers/assets_manager.dart';
import '../../../domain/profile/entites/user_entity.dart';
import '../models/user_data_model.dart';

extension ToDomain on UserDataModel {
  UserEntity toDomain() {
    return UserEntity(
      id: id,
      name: userName,
      rating: "3.5",
      imgUrl: photoUrl ?? ImgManager.defaultProfileImg,
      phoneNumber: phoneNumber ?? "",
    );
  }
}
