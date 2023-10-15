import '../../../app/core/usecase/usecase.dart';
import '../repos/auth_repo.dart';

class IsLoggedUsecase extends BaseUsecase<bool, NoParams> {
  final AuthRepo _authRepo;

  IsLoggedUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  bool call(NoParams params) {
    return _authRepo.isLoggedIn();
  }
}
